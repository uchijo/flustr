import 'package:flustr/controller/profile_provider.dart';
import 'package:flustr/view/component/copyable_pubkey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.npub,
  }) : super(key: key);

  final String npub;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: switch (profile) {
          AsyncData(value: final profile) => ListView(
              children: [
                // app bar周り
                ProfileHeader(profile: profile),

                // 投稿を出すところ
                for (var i = 0; i < 30; i++) ...const [
                  Text('hogehoge'),
                  SizedBox(height: 30),
                ]
              ],
            ),

          // 読み込み中
          AsyncLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          AsyncError(error: final _, stackTrace: final _) => const Center(
              child: Text('Oops! something went wrong'),
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
            profile.icon,
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
                profile.username,
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
