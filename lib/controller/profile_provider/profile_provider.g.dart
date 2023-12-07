// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDataImpl _$$ProfileDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDataImpl(
      username: json['username'] as String,
      icon: json['icon'] as String,
      about: json['about'] as String,
      pubHex: json['pubHex'] as String,
    );

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'icon': instance.icon,
      'about': instance.about,
      'pubHex': instance.pubHex,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileHash() => r'067cfac98a1ed889d60e7523962a3a0bda80e69e';

/// See also [profile].
@ProviderFor(profile)
final profileProvider = AutoDisposeFutureProvider<ProfileData>.internal(
  profile,
  name: r'profileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileRef = AutoDisposeFutureProviderRef<ProfileData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
