// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NsecAppSettingImpl _$$NsecAppSettingImplFromJson(Map<String, dynamic> json) =>
    _$NsecAppSettingImpl(
      nsec1: json['nsec1'] as String,
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
      npub1: json['npub1'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NpubAppSettingImplToJson(
        _$NpubAppSettingImpl instance) =>
    <String, dynamic>{
      'npub1': instance.npub1,
      'runtimeType': instance.$type,
    };

_$EmptyAppSettingImpl _$$EmptyAppSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$EmptyAppSettingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyAppSettingImplToJson(
        _$EmptyAppSettingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingNotifierHash() => r'9ff1269bdbde557777b3b5b4153b6820be6b1422';

/// See also [SettingNotifier].
@ProviderFor(SettingNotifier)
final settingNotifierProvider =
    AsyncNotifierProvider<SettingNotifier, AppSetting>.internal(
  SettingNotifier.new,
  name: r'settingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingNotifier = AsyncNotifier<AppSetting>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
