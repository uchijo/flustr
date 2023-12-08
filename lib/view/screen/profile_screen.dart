import 'package:flustr/controller/profile_provider/profile_provider.dart';
import 'package:flustr/controller/user_posts_notifier/user_posts_notifier.dart';
import 'package:flustr/view/component/copyable_pubkey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.pubHex,
  }) : super(key: key);

  final String pubHex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider(pubHex));
    final rawPosts = ref.watch(UserPostsNotifierProvider(pubHex));
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: switch (profile) {
          AsyncData(value: final profile) => ListView(
              children: [
                // app bar周り
                ProfileHeader(profile: profile),

                // 投稿を出すところ
                ...switch (rawPosts) {
                  AsyncData(value: final posts) =>
                    posts.map((e) => Text(e.content)),
                  AsyncError(:final error, :final stackTrace) => [
                      Text(error.toString()),
                      Text(stackTrace.toString()),
                    ],
                  _ => [],
                }
              ],
            ),

          // 読み込み中
          AsyncLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          AsyncError(error: final error, stackTrace: final _) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Oops! something went wrong'),
                  Text(error.toString()),
                ],
              ),
            ),
          AsyncValue() => const Center(
              child: Text('Oops! something went wrong'),
            ),
        },
      ),
    );
  }
}

// アイコン、ユーザ名、pubkeyを出すウィジェット
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.profile});

  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),

        // ユーザアイコン
        Container(
          clipBehavior: Clip.antiAlias,
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            profile.picture,
          ),
        ),

        // アイコンの下の文字
        Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: theme.colorScheme.background),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ユーザ名
              Text(
                profile.name,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 24,
                ),
              ),

              // コピー機能付きpubkey
              CopyablePubkey(pubkey: profile.pubHex),

              // about
              Text(profile.about),
            ],
          ),
        ),
      ],
    );
  }
}
