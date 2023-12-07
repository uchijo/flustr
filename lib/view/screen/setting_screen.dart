import 'package:flustr/controller/setting_provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// テキストフィールドの内容を保持しておく
String _textFieldContent = '';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingNotifierProvider);
    final settingsController = ref.watch(settingNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('seckey is set: ${settings?.getNsec1 != null}'),
          Text('pubkey is set: ${settings?.getNpub1 != null}'),
          const SizedBox(height: 30),
          const Text('key setting'),

          // 入力
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _textFieldContent = value;
                    },
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    settingsController.setKey(_textFieldContent);
                  },
                  child: const Text('save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
