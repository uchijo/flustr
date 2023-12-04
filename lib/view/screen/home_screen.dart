import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          // navigate to my profile
          onPressed: () {},
          icon: Icon(
            Icons.person,
            color: Theme.of(context).primaryIconTheme.color,
          ),
        ),
        actions: [
          IconButton(
            // navigate to notification page
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
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
