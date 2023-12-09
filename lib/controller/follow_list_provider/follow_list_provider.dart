import 'package:collection/collection.dart';
import 'package:flustr/controller/connection_pool_provider/connection_pool_provider.dart';
import 'package:nostr/nostr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_list_provider.g.dart';

@riverpod
FutureOr<List<String>> followList(FollowListRef ref, String pubHex) async {
  final pool = ref.watch(connectionPoolProvider);
  if (pool == null) {
    throw Exception('pool is null');
  }
  final hoge = await pool.getStoredEvent(
    [
      Filter(
        kinds: [3],
        authors: [pubHex],
      ),
    ],
    timeout: const Duration(seconds: 5),
  );
  final followeesPubHex = hoge
      .map(
        (e) => e.tags
            .where((element) => element.first == 'p')
            .map((e) => e[1])
            .toList(),
      )
      .flattened
      .toList();
  print(followeesPubHex);
  print(followeesPubHex.length);
  return followeesPubHex;
}
