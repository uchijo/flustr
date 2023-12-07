import 'package:flustr/view/screen/profile_screen.dart';
import 'package:flustr/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(pubHex: 'hoge'),
              ),
            );
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
