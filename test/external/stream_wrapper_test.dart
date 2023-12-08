import 'package:flustr/external/stream_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nostr/nostr.dart';

final now = (DateTime.now().millisecondsSinceEpoch / 1000).floor();

final _validEvent1 = Event(
  '94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1',
  'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
  now,
  0,
  [],
  '{"lud06":"","website":"https://www.uchijo.com","nip05":"uchijo@www.uchijo.com","picture":"https://www.uchijo.com/icon.jpg","display_name":"uchijo","about":"おいも　おいも","name":"uchijo"}',
  '33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83',
  verify: false,
);

// 5 seconds later
final _validEvent2 = Event(
  '94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e1aaa',
  'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
  now + 5,
  0,
  [],
  '{"lud06":"","website":"https://www.uchijo.com","nip05":"uchijo@www.uchijo.com","picture":"https://www.uchijo.com/icon.jpg","display_name":"uchijo","about":"おいも　おいも","name":"uchijo"}',
  '33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83',
  verify: false,
);

void main() {
  group('tests for StreamWrapper', () {
    test('receive 2 unique events within 5 secs, if span is 1 minute',
        () async {
      final aggregator = StreamAggregator();
      final got = <Event>[];
      aggregator.eventStream.listen((event) {
        got.add(event);
      });

      aggregator.addEvent(_validEvent1);
      aggregator.addEvent(_validEvent2);

      await Future.delayed(const Duration(milliseconds: 100));

      expect(got.length, 2);
      expect(got[0].id, _validEvent1.id);
      expect(got[1].id, _validEvent2.id);
    });
    test('receive 2 unique events with duplicates within 5 secs', () async {
      final aggregator = StreamAggregator();
      final got = <Event>[];
      aggregator.eventStream.listen((event) {
        got.add(event);
      });

      aggregator.addEvent(_validEvent1);
      aggregator.addEvent(_validEvent1);
      aggregator.addEvent(_validEvent1);
      aggregator.addEvent(_validEvent1);
      aggregator.addEvent(_validEvent2);
      aggregator.addEvent(_validEvent2);
      aggregator.addEvent(_validEvent2);
      aggregator.addEvent(_validEvent2);
      aggregator.addEvent(_validEvent2);

      await Future.delayed(const Duration(milliseconds: 100));

      expect(got.length, 2);
      expect(got[0].id, _validEvent1.id);
      expect(got[1].id, _validEvent2.id);
    });
    test('receive 3 unique events within 5 secs, if cleanup span is 1 sec',
        () async {
      final aggregator = StreamAggregator(rotateBy: const Duration(seconds: 1));
      final got = <Event>[];
      aggregator.eventStream.listen((event) {
        got.add(event);
      });

      aggregator.addEvent(_validEvent1);
      aggregator.addEvent(_validEvent2);

      await Future.delayed(const Duration(seconds: 5));

      aggregator.addEvent(_validEvent1);

      await Future.delayed(const Duration(milliseconds: 100));

      expect(got.length, 3);
    });
  });
}
