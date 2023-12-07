// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingImpl _$$AppSettingImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingImpl(
      secKeyHex: json['secKeyHex'] as String?,
    );

Map<String, dynamic> _$$AppSettingImplToJson(_$AppSettingImpl instance) =>
    <String, dynamic>{
      'secKeyHex': instance.secKeyHex,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingNotifierHash() => r'ac106ec7516686b06162e2abcb43426ea6ff7099';

/// See also [SettingNotifier].
@ProviderFor(SettingNotifier)
final settingNotifierProvider =
    AutoDisposeNotifierProvider<SettingNotifier, AppSetting>.internal(
  SettingNotifier.new,
  name: r'settingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingNotifier = AutoDisposeNotifier<AppSetting>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
