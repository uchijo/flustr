import 'package:flustr/controller/setting_provider/setting_provider.dart';
import 'package:flustr/view/screen/profile_screen.dart';
import 'package:flustr/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pubHex = switch (ref.watch(settingNotifierProvider)) {
      AsyncData(:final value) => value.hexPubKey,
      _ => null,
    };
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
      body: ListView(
        children: const [
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
          Text('hogehoge'),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
