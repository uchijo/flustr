import 'package:flustr/controller/current_pubhex_provider/current_pubhex_provider.dart';
import 'package:flustr/controller/timeline_posts_notifier/timeline_posts_notifier.dart';
import 'package:flustr/view/component/event_view.dart';
import 'package:flustr/view/screen/profile_screen.dart';
import 'package:flustr/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pubHex = ref.watch(currentPubHexProvider);
    final timelinePosts = ref.watch(timelinePostsNotifierProvider);

    return Scaffold(
      // 投稿ボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          // navigate to my profile
          onPressed: () {
            if (pubHex != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(pubHex: pubHex),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (ctx) =>
                    const Text('please enter key in setting screen.'),
              );
            }
          },
          icon: Icon(
            Icons.person,
            color: Theme.of(context).primaryIconTheme.color,
          ),
        ),
        actions: [
          IconButton(
            // navigate to setting page
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingScreen()),
              );
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(timelinePostsNotifierProvider),
        child: ListView(
          children: switch (timelinePosts) {
            AsyncLoading() => [const LinearProgressIndicator()],
            AsyncError(:final error, :final stackTrace) => [
                Text(error.toString()),
                Text(stackTrace.toString()),
              ],
            AsyncData(value: final posts) =>
              posts.map((e) => EventView(event: e)).toList(),
            _ => [const Text('Oops! something went wrong!')],
          },
        ),
      ),
    );
  }
}
