// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NsecAppSettingImpl _$$NsecAppSettingImplFromJson(Map<String, dynamic> json) =>
    _$NsecAppSettingImpl(
      nsec1: json['nsec1'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NsecAppSettingImplToJson(
        _$NsecAppSettingImpl instance) =>
    <String, dynamic>{
      'nsec1': instance.nsec1,
      'runtimeType': instance.$type,
    };

_$NpubAppSettingImpl _$$NpubAppSettingImplFromJson(Map<String, dynamic> json) =>
    _$NpubAppSettingImpl(
      npub1: json['npub1'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NpubAppSettingImplToJson(
        _$NpubAppSettingImpl instance) =>
    <String, dynamic>{
      'npub1': instance.npub1,
      'runtimeType': instance.$type,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingNotifierHash() => r'3f53f41e586ee5619347f7c1272a18e2981d7c19';

/// See also [SettingNotifier].
@ProviderFor(SettingNotifier)
final settingNotifierProvider =
    AutoDisposeNotifierProvider<SettingNotifier, AppSetting?>.internal(
  SettingNotifier.new,
  name: r'settingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingNotifier = AutoDisposeNotifier<AppSetting?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
