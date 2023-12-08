import 'dart:convert';
import 'dart:io';

import 'package:flustr/external/subscription.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nostr/nostr.dart';

Future<void> main() async {
  var accessCount1 = 0;
  void Function(WebSocket socket, dynamic event) receivedBehavior = (_, __) {};

  setUpAll(() async {
    final awaitingSocket = await ServerSocket.bind('localhost', 8888);
    final server = HttpServer.listenOn(awaitingSocket);

    // websocket接続待ち受け
    server.listen((req) async {
      final serverSocket = await WebSocketTransformer.upgrade(req);

      // socketごとのイベント待ち受け
      serverSocket.listen((event) {
        try {
          receivedBehavior(serverSocket, event);
        } finally {
          accessCount1++;
        }
      });
    });
  });

  setUp(() {
    accessCount1 = 0;
  });

  group('summarizeUntilEose周り', () {
    test('向こうから返事が来たら、eventだけ拾って返す', () async {
      receivedBehavior = (serverSocket, event) {
        final decoded = jsonDecode(event);
        final parsed = Request.deserialize(decoded);
        if (accessCount1 == 0) {
          serverSocket.add(
              '["EVENT","${parsed.subscriptionId}",{"content":"{\\"lud06\\":\\"\\",\\"website\\":\\"https://www.uchijo.com\\",\\"nip05\\":\\"uchijo@www.uchijo.com\\",\\"picture\\":\\"https://www.uchijo.com/icon.jpg\\",\\"display_name\\":\\"uchijo\\",\\"about\\":\\"おいも　おいも\\",\\"name\\":\\"uchijo\\"}","created_at":1701491059,"id":"94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1","kind":0,"pubkey":"e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7","sig":"33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83","tags":[]}]');
          serverSocket.add('["EOSE","${parsed.subscriptionId}"]');
        }
      };

      final socket = await WebSocket.connect('ws://localhost:8888');
      final result = await summariseUntilEose([
        Filter(
          authors: [
            'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7'
          ],
          kinds: [0],
          limit: 2,
        ),
      ], (
        socket,
        socket.asBroadcastStream()
      ), timeout: const Duration(seconds: 4));

      // サーバ側でcloseを受け取れるように待つ
      await Future.delayed(const Duration(seconds: 1));

      expect(result.length, 1);
      expect(accessCount1, 2);
      final content = jsonDecode(result.first.content) as Map<String, dynamic>;
      expect(content['nip05'], 'uchijo@www.uchijo.com');
      expect(content['name'], 'uchijo');
      expect(content['display_name'], 'uchijo');
    });

    test('タイムアウトする場合の動作', () async {
      receivedBehavior = (_, __) {};
      final socket = await WebSocket.connect('ws://localhost:8888');
      final result = await summariseUntilEose(
        [
          Filter(
            authors: [
              'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7'
            ],
            kinds: [0],
            limit: 2,
          ),
        ],
        (socket, socket.asBroadcastStream()),
      );

      // サーバ側の処理を少し待つ
      await Future.delayed(const Duration(seconds: 1));

      expect(
        result.length,
        0,
        reason: '空配列が来ていない',
      );
      expect(
        accessCount1,
        2,
        reason: '最初のrequest, closeのメッセージの2つが届いているはずである',
      );
    });

    test('関係のないイベントは拾わない', () async {
      receivedBehavior = (serverSocket, event) {
        // 関係ないものも投げる
        final decoded = jsonDecode(event);
        final parsed = Request.deserialize(decoded);
        if (accessCount1 == 0) {
          serverSocket.add(
              '["EVENT","${parsed.subscriptionId}",{"content":"{\\"lud06\\":\\"\\",\\"website\\":\\"https://www.uchijo.com\\",\\"nip05\\":\\"uchijo@www.uchijo.com\\",\\"picture\\":\\"https://www.uchijo.com/icon.jpg\\",\\"display_name\\":\\"uchijo\\",\\"about\\":\\"おいも　おいも\\",\\"name\\":\\"uchijo\\"}","created_at":1701491059,"id":"94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1","kind":0,"pubkey":"e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7","sig":"33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83","tags":[]}]');
          serverSocket.add(
              '["EVENT","hoge",{"content":"{\\"lud06\\":\\"\\",\\"website\\":\\"https://www.uchijo.com\\",\\"nip05\\":\\"uchijo@www.uchijo.com\\",\\"picture\\":\\"https://www.uchijo.com/icon.jpg\\",\\"display_name\\":\\"uchijo\\",\\"about\\":\\"おいも　おいも\\",\\"name\\":\\"uchijo\\"}","created_at":1701491059,"id":"94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1","kind":0,"pubkey":"e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7","sig":"33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83","tags":[]}]');
          serverSocket.add('["EOSE","${parsed.subscriptionId}"]');
        }
      };
      final socket = await WebSocket.connect('ws://localhost:8888');
      final result = await summariseUntilEose([
        Filter(
          authors: [
            'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7'
          ],
          kinds: [0],
          limit: 2,
        ),
      ], (
        socket,
        socket.asBroadcastStream()
      ), timeout: const Duration(seconds: 4));

      // サーバ側でcloseを受け取れるように待つ
      await Future.delayed(const Duration(seconds: 1));

      expect(result.length, 1);
      expect(accessCount1, 2);
      final content = jsonDecode(result.first.content) as Map<String, dynamic>;
      expect(content['nip05'], 'uchijo@www.uchijo.com');
      expect(content['name'], 'uchijo');
      expect(content['display_name'], 'uchijo');
    });

    test('関係のないeoseは無視', () async {
      receivedBehavior = (serverSocket, event) {
        // 関係ないものも投げる
        final decoded = jsonDecode(event);
        final parsed = Request.deserialize(decoded);
        if (accessCount1 == 0) {
          serverSocket.add('["EOSE","hogehoge"]');
          serverSocket.add(
              '["EVENT","${parsed.subscriptionId}",{"content":"{\\"lud06\\":\\"\\",\\"website\\":\\"https://www.uchijo.com\\",\\"nip05\\":\\"uchijo@www.uchijo.com\\",\\"picture\\":\\"https://www.uchijo.com/icon.jpg\\",\\"display_name\\":\\"uchijo\\",\\"about\\":\\"おいも　おいも\\",\\"name\\":\\"uchijo\\"}","created_at":1701491059,"id":"94b7d931f464918a25924817175c09e862a4255914025c6219a872694c2e19f1","kind":0,"pubkey":"e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7","sig":"33abb3ea88161bfbaa2a496e5255faf3bdfa938804846f80e6f6cc7ae1ab17c31f124f3683dc80126f1448a456fcaa8582f1f16bd8c1f2f01136c9cf04482c83","tags":[]}]');
          serverSocket.add('["EOSE","${parsed.subscriptionId}"]');
        }
      };
      final socket = await WebSocket.connect('ws://localhost:8888');
      final result = await summariseUntilEose([
        Filter(
          authors: [
            'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7'
          ],
          kinds: [0],
          limit: 2,
        ),
      ], (
        socket,
        socket.asBroadcastStream()
      ), timeout: const Duration(seconds: 4));

      // サーバ側でcloseを受け取れるように待つ
      await Future.delayed(const Duration(seconds: 1));

      expect(result.length, 1);
      expect(accessCount1, 2);
      final content = jsonDecode(result.first.content) as Map<String, dynamic>;
      expect(content['nip05'], 'uchijo@www.uchijo.com');
      expect(content['name'], 'uchijo');
      expect(content['display_name'], 'uchijo');
    });
  });
}
