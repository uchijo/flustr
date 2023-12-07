// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSetting _$AppSettingFromJson(Map<String, dynamic> json) {
  return _AppSetting.fromJson(json);
}

/// @nodoc
mixin _$AppSetting {
  String? get secKeyHex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingCopyWith<AppSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingCopyWith<$Res> {
  factory $AppSettingCopyWith(
          AppSetting value, $Res Function(AppSetting) then) =
      _$AppSettingCopyWithImpl<$Res, AppSetting>;
  @useResult
  $Res call({String? secKeyHex});
}

/// @nodoc
class _$AppSettingCopyWithImpl<$Res, $Val extends AppSetting>
    implements $AppSettingCopyWith<$Res> {
  _$AppSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secKeyHex = freezed,
  }) {
    return _then(_value.copyWith(
      secKeyHex: freezed == secKeyHex
          ? _value.secKeyHex
          : secKeyHex // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingImplCopyWith<$Res>
    implements $AppSettingCopyWith<$Res> {
  factory _$$AppSettingImplCopyWith(
          _$AppSettingImpl value, $Res Function(_$AppSettingImpl) then) =
      __$$AppSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? secKeyHex});
}

/// @nodoc
class __$$AppSettingImplCopyWithImpl<$Res>
    extends _$AppSettingCopyWithImpl<$Res, _$AppSettingImpl>
    implements _$$AppSettingImplCopyWith<$Res> {
  __$$AppSettingImplCopyWithImpl(
      _$AppSettingImpl _value, $Res Function(_$AppSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secKeyHex = freezed,
  }) {
    return _then(_$AppSettingImpl(
      secKeyHex: freezed == secKeyHex
          ? _value.secKeyHex
          : secKeyHex // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingImpl implements _AppSetting {
  _$AppSettingImpl({this.secKeyHex});

  factory _$AppSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingImplFromJson(json);

  @override
  final String? secKeyHex;

  @override
  String toString() {
    return 'AppSetting(secKeyHex: $secKeyHex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingImpl &&
            (identical(other.secKeyHex, secKeyHex) ||
                other.secKeyHex == secKeyHex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, secKeyHex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingImplCopyWith<_$AppSettingImpl> get copyWith =>
      __$$AppSettingImplCopyWithImpl<_$AppSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingImplToJson(
      this,
    );
  }
}

abstract class _AppSetting implements AppSetting {
  factory _AppSetting({final String? secKeyHex}) = _$AppSettingImpl;

  factory _AppSetting.fromJson(Map<String, dynamic> json) =
      _$AppSettingImpl.fromJson;

  @override
  String? get secKeyHex;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingImplCopyWith<_$AppSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
