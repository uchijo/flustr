import 'dart:async';
import 'dart:io';

import 'package:nostr/nostr.dart';

// eoseまで一つのリレーから値を受け取るオブジェクト
class OneshotSubscription {
  OneshotSubscription(this._filters, this._socket) {
    _subscriptionId = generate64RandomHexChars().substring(0, 32);
  }
  late final String _subscriptionId;
  final WebSocket _socket;
  // eose時に解決する
  final Completer<void> _gotEose = Completer();
  final List<Filter> _filters;
  final List<Event> events = <Event>[];
  bool _isEose = false;

  Future<void> get gotEose => _gotEose.future;
  bool get isEose => _isEose;

  void receive({Duration timeout = const Duration(milliseconds: 5000)}) {
    final request = Request(_subscriptionId, _filters);

    final sub = _socket.listen((rawMessage) {
      final message = Message.deserialize(rawMessage);
      switch (message.messageType) {
        case MessageType.event:
          if (!_isEose) {
            final event = message.message as Event;
            events.add(event);
          }
          break;
        case MessageType.eose:
          _socket.add(Close(_subscriptionId).serialize());
          _gotEose.complete();
          _isEose = true;
          break;
        default:
          // do nothing
          break;
      }
    });
    _socket.add(request.serialize());
    Future.any([gotEose, Future.delayed(timeout)]).then((value) {
      sub.cancel();
      if (!_gotEose.isCompleted) {
        _gotEose.complete();
      }
    });
  }
}
