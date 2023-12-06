import 'dart:async';

import 'package:nostr/nostr.dart';

class StreamWrapper {
  StreamWrapper(this._poolCleaner) {
    _events = StreamController<Event>();
  }
  late final StreamController<Event> _events;
  final void Function() _poolCleaner;

  StreamSink<Event> get eventSink => _events.sink;
  Stream<Event> get eventStream => _events.stream;

  Future<void> dispose() async {
    _poolCleaner();
    _events.close();
  }
}
