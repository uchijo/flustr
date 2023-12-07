import 'package:flustr/controller/profile_provider/profile_provider.dart';
import 'package:flustr/external/connection_pool.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nostr/nostr.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ConnectionPool>()])
import 'profile_provider_test.mocks.dart';

final _validEvent1 = Event(
  '94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1',
  'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
  1701491059,
  0,
  [],
  '{"lud06":"","website":"https://www.uchijo.com","nip05":"uchijo@www.uchijo.com","picture":"https://www.uchijo.com/icon.jpg","display_name":"uchijo","about":"おいも　おいも","name":"uchijo"}',
  '33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83',
  verify: false,
);

final _validEvent2 = Event(
  '94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1',
  'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
  1701591059,
  0,
  [],
  '{"lud06":"","website":"https://www.uchijo.com","nip05":"uchijo@www.uchijo.com","picture":"https://www.uchijo.com/icon.jpg","display_name":"uchijo","about":"おいも　おいも","name":"uchijo"}',
  '33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83',
  verify: false,
);

final _invalidEvent1 = Event(
  '94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1',
  'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
  1701491059,
  1,
  [],
  'hoge',
  '33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83',
  verify: false,
);

final _invalidEvent2 = Event(
  '94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1',
  'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
  1701491059,
  0,
  [],
  'hoge',
  '33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83',
  verify: false,
);

void main() {
  group('tests for ProfileData', () {
    test('正しいkind0をパースできる', () {
      final parsed = ProfileData.fromEvent(_validEvent1);
      expect(parsed.name, 'uchijo');
      expect(parsed.picture, 'https://www.uchijo.com/icon.jpg');
      expect(parsed.about, 'おいも　おいも');
    });
    test('変なのが来たらエラーを吐く', () {
      expect(
        () => ProfileData.fromEvent(_invalidEvent1),
        throwsA(const TypeMatcher<Object>()),
      );
      expect(
        () => ProfileData.fromEvent(_invalidEvent2),
        throwsA(const TypeMatcher<Object>()),
      );
    });
  });

  group('tests for fetchProfile', () {
    test('イベント1個取得できたときの正常系', () async {
      final mockPool = MockConnectionPool();
      when(mockPool.getStoredEvent(any))
          .thenAnswer((_) async => [_validEvent1]);
      final result = await fetchProfile(mockPool, '');
      expect(result != null, true);
    });
    test('イベント取得数が1以外の場合にnullになる1', () async {
      final mockPool = MockConnectionPool();
      when(mockPool.getStoredEvent(any)).thenAnswer(
        (_) async => [_validEvent1, _validEvent2],
      );
      final result = await fetchProfile(mockPool, '');
      expect(result == null, true);
    });
    test('イベント取得数が1以外の場合にnullになる2', () async {
      final mockPool = MockConnectionPool();
      when(mockPool.getStoredEvent(any)).thenAnswer(
        (_) async => [],
      );
      final result = await fetchProfile(mockPool, '');
      expect(result == null, true);
    });
    test('変なイベントが出てきたときにnullになる', () async {
      final mockPool = MockConnectionPool();
      when(mockPool.getStoredEvent(any)).thenAnswer(
        (_) async => [_invalidEvent1],
      );
      final result = await fetchProfile(mockPool, '');
      expect(result == null, true);
    });
    test('ちゃんとした引数が渡されてることを確認', () async {
      final mockPool = MockConnectionPool();
      final _ = await fetchProfile(mockPool, 'simple_npub');
      final captured = verify(mockPool.getStoredEvent(captureAny)).captured;
      expect(captured.first.length, 1);
      expect(captured.first is List<Filter>, true);
      final filters = captured.first as List<Filter>;
      expect(filters.first.authors?.contains('simple_npub'), true);
    });
  });
}
