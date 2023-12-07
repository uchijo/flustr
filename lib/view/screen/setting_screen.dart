import 'package:flustr/controller/setting_provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: Column(
        children: [
          Text('seckey is set: ${settings.secKeyHex != null}'),
        ],
      ),
    );
  }
}
