import 'dart:convert';

import 'package:flustr/external/connection_pool.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nostr/nostr.dart';

void main() {
  test(
    'uchijoのprofileを取得可能',
    () async {
      final pool = ConnectionPool(
        [
          'wss://relay.damus.io',
          'wss://nostr.holybea.com',
          'wss://relay-jp.nostr.wirednet.jp',
        ],
      );
      final result = await pool.getStoredEvent([
        Filter(
          authors: [
            'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7'
          ],
          kinds: [0],
          limit: 2,
        ),
      ]);
      expect(result.length, 1);
      final content = jsonDecode(result.first.content) as Map;
      expect(content['name'], 'uchijo');
      print(content);
    },
  );
  test(
    'uchijoの直近の投稿を5件重複なしで取得可能',
    () async {
      final pool = ConnectionPool(
        [
          'wss://relay.damus.io',
          'wss://nostr.holybea.com',
          'wss://relay-jp.nostr.wirednet.jp',
        ],
      );
      final result = await pool.getStoredEvent([
        Filter(
          authors: [
            'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7'
          ],
          kinds: [1],
          limit: 5,
        ),
      ]);
      expect(result.length, 5);
    },
  );
}
