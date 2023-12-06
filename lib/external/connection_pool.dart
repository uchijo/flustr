import 'dart:async';
import 'dart:io';

import 'package:flustr/external/stream_wrapper.dart';
import 'package:flustr/external/subscription.dart';
import 'package:nostr/nostr.dart';

class ConnectionPool {
  ConnectionPool(this._urls) {
    final completer = Completer<void>();
    connected = completer.future;

    subscriptions = <String, StreamWrapper>{};
    final socketFutures = <Future<WebSocket>>[];
    for (final url in _urls) {
      socketFutures.add(WebSocket.connect(url));
    }
    print('hogehoge~');
    Future.wait(socketFutures).then(
      (sockets) async {
        print('connected~');
        relays = sockets;
        completer.complete();
      },
    );
  }

  // 接続完了後にresolveされる
  late Future<void> connected;

  // イベントが降ってくるリレー
  final List<String> _urls;
  late final List<WebSocket> relays;

  // subscriptionに対応する出力先stream
  late final Map<String, StreamWrapper> subscriptions;

  Future<List<Event>> getStoredEvent(List<Filter> filters) async {
    // websocket接続前に呼ばれたら待つ
    await connected;

    // 全部のソケットでeoseまで待つ
    final subs = <OneshotSubscription>[];
    for (final relay in relays) {
      final sub = OneshotSubscription(filters, relay);
      subs.add(sub);
      sub.receive();
    }
    await Future.wait(subs.map((e) => e.gotEose));

    // 重複を消しつつ集計
    final events = <Event>[];
    final ids = <String>{};
    for (final sub in subs) {
      for (final event in sub.events) {
        if (!ids.contains(event.id)) {
          events.add(event);
          ids.add(event.id);
        }
      }
    }

    return events;
  }

  // Future<(List<Event>, StreamWrapper)> getStoredAndUpdate(
  //     List<Filter> filters) async {
  //   return (<Event>[], StreamWrapper(() {}));
  // }
}
