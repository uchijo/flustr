import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_provider.freezed.dart';
part 'setting_provider.g.dart';

// run this to generate code
// dart run build_runner build

@freezed
class AppSetting with _$AppSetting {
  factory AppSetting({
    String? secKeyHex,
  }) = _AppSetting;

  factory AppSetting.fromJson(Map<String, dynamic> json) =>
      _$AppSettingFromJson(json);
}

@riverpod
class SettingNotifier extends _$SettingNotifier {
  @override
  AppSetting build() {
    return AppSetting();
  }

  void applySetting(AppSetting newSetting) {
    state = newSetting;
  }
}
