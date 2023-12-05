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
      body: SafeArea(
        child: switch (profile) {
          AsyncData(value: final profile) => Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    // app bar周り
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      surfaceTintColor: Colors.white,
                      expandedHeight: 300,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: ChangeVisibleTitle(
                          title: Text(
                            profile.username,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        background: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ProfileHeader(profile: profile),
                        ),
                      ),
                    ),

                    // 投稿を出すところ
                    SliverList.list(
                      children: [
                        // とりあえずダミー
                        for (var i = 0; i < 30; i++) ...const [
                          Text('hogehoge'),
                          SizedBox(height: 30),
                        ]
                      ],
                    )
                  ],
                ),
                IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
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
              CopyablePubkey(pubkey: profile.pubHex)
            ],
          ),
        )
      ],
    );
  }
}

class ChangeVisibleTitle extends StatefulWidget {
  const ChangeVisibleTitle({super.key, required this.title});

  final Widget title;

  @override
  State<ChangeVisibleTitle> createState() => _ChangeVisibleTitleState();
}

class _ChangeVisibleTitleState extends State<ChangeVisibleTitle> {
  ScrollPosition? _position;
  bool _visible = false;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType();
    final visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (visible != _visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 80),
      child: widget.title,
    );
  }
}
