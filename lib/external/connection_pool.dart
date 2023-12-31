import 'dart:async';
import 'dart:io';

import 'package:flustr/external/stream_wrapper.dart';
import 'package:flustr/external/subscription.dart';
import 'package:nostr/nostr.dart';

class ConnectionPool {
  ConnectionPool(this._urls) {
    final completer = Completer<void>();
    connected = completer.future;

    final socketFutures = <Future<WebSocket>>[];
    for (final url in _urls) {
      socketFutures.add(WebSocket.connect(url));
    }
    Future.wait(socketFutures).then(
      (sockets) async {
        final tmp = sockets.map((e) => (e, e.asBroadcastStream())).toList();
        relays = tmp;
        completer.complete();
      },
    );
  }

  void dispose() {
    for (final (socket, _) in relays) {
      socket.close();
    }
  }

  // 接続完了後にresolveされる
  late Future<void> connected;

  // イベントが降ってくるリレー
  final List<String> _urls;
  late final List<(WebSocket, Stream<dynamic>)> relays;

  Future<void> addEvent(Event e) async {
    for (final (adder, _) in relays) {
      adder.add(e.serialize());
    }
  }

  Future<List<Event>> getStoredEvent(
    List<Filter> filters, {
    Duration timeout = const Duration(milliseconds: 500),
  }) async {
    // websocket接続前に呼ばれたら待つ
    await connected;

    // 全部のソケットでeoseまで待つ
    final subs = <Future<List<Event>>>[];
    for (final relay in relays) {
      subs.add(summariseUntilEose(filters, relay, timeout: timeout));
    }
    final overlappingEventsList = await Future.wait(subs);

    // 重複を消しつつ集計
    final events = <Event>[];
    final ids = <String>{};
    for (final overlappingEvents in overlappingEventsList) {
      for (final event in overlappingEvents) {
        if (!ids.contains(event.id)) {
          events.add(event);
          ids.add(event.id);
        }
      }
    }

    return events;
  }

  // eose後の,複数relayからのstreamをよしなにまとめるStreamを返す
  StreamAggregator getEventStreamAfterEose(
    List<Filter> filters,
  ) {
    final aggregator = StreamAggregator();

    // list of functions that closes each subscription by sending Close(subId)
    final closers = <void Function()>[];
    // list of functions that cancels each listens on websockets
    final cancelers = <void Function()>[];

    for (final relay in relays) {
      final subId = generate64RandomHexChars().substring(0, 32);

      // prepare for listen
      bool eose = false;
      final sub = relay.$2.listen((rawMessage) {
        final message = Message.deserialize(rawMessage);
        switch (message.messageType) {
          case MessageType.eose:
            if ((message.message as Eose).subscriptionId == subId) {
              eose = true;
            }
            break;
          case MessageType.event:
            if (eose &&
                message.message is Event &&
                (message.message as Event).subscriptionId == subId) {
              aggregator.addEvent(message.message as Event);
            }
            break;
          default:
            // do nothing
            break;
        }
      });
      cancelers.add(() {
        sub.cancel();
      });

      // subscription stuff
      final req = Request(subId, filters);
      relay.$1.add(req.serialize());
      closers.add(() {
        relay.$1.add(Close(subId).serialize());
      });
    }

    aggregator.cleanUp = () {
      for (final fun in cancelers) {
        fun();
      }
      for (final fun in closers) {
        fun();
      }
    };

    return aggregator;
  }
}

Event buildTextEvent(String content, String secHex) {
  return Event.from(kind: 1, content: content, privkey: secHex);
}

// Future<bool> _addEventHelper(
//   WebSocket socket,
//   Stream<dynamic> out,
//   Event e,
// ) async {
//   socket.add(e.serialize());
//   final okCompleter = Completer();
//   var ok = false;
//   out.listen((msg) {
//     final message = Message.deserialize(msg);
//     switch (message.messageType) {
//       case MessageType.ok:
//         ok = true;
//         okCompleter.complete();
//         break;
//       default:
//         break;
//     }
//   });
//   await Future.wait([
//     Future.delayed(const Duration(milliseconds: 1000)),
//     okCompleter.future,
//   ]);
//   return ok;
// }
