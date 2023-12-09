import 'package:collection/collection.dart';
import 'package:flustr/controller/connection_pool_provider/connection_pool_provider.dart';
import 'package:nostr/nostr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_posts_notifier.g.dart';

@riverpod
class UserPostsNotifier extends _$UserPostsNotifier {
  @override
  Future<List<Event>> build(String pubHex) async {
    final pool = ref.watch(connectionPoolProvider);
    if (pool == null) {
      throw Exception('connection pool is null.');
    }
    final posts = await pool.getStoredEvent(
      [
        Filter(
          authors: [pubHex],
          kinds: [1],
          limit: 30,
        ),
      ],
      // fixme: タイムアウトはもっと考えたほうが良さそう
      timeout: const Duration(seconds: 3),
    );
    final aggregator = pool.getEventStreamAfterEose(
      [
        Filter(
          authors: [pubHex],
          kinds: [1],
          limit: 30,
        ),
      ],
    );
    aggregator.eventStream.listen((e) {
      state = switch (state) {
        AsyncData(:final value) => AsyncData([e, ...value]),
        _ => state,
      };
    });
    ref.onDispose(() {
      aggregator.dispose();
    });
    return posts
        .sortedBy<num>((element) => element.createdAt)
        .reversed
        .toList();
  }
}
