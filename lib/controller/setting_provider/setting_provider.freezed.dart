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
  switch (json['runtimeType']) {
    case 'nsec':
      return NsecAppSetting.fromJson(json);
    case 'npub':
      return NpubAppSetting.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppSetting',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppSetting {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? nsec1) nsec,
    required TResult Function(String? npub1) npub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? nsec1)? nsec,
    TResult? Function(String? npub1)? npub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? nsec1)? nsec,
    TResult Function(String? npub1)? npub,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NsecAppSetting value) nsec,
    required TResult Function(NpubAppSetting value) npub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NsecAppSetting value)? nsec,
    TResult? Function(NpubAppSetting value)? npub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NsecAppSetting value)? nsec,
    TResult Function(NpubAppSetting value)? npub,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingCopyWith<$Res> {
  factory $AppSettingCopyWith(
          AppSetting value, $Res Function(AppSetting) then) =
      _$AppSettingCopyWithImpl<$Res, AppSetting>;
}

/// @nodoc
class _$AppSettingCopyWithImpl<$Res, $Val extends AppSetting>
    implements $AppSettingCopyWith<$Res> {
  _$AppSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NsecAppSettingImplCopyWith<$Res> {
  factory _$$NsecAppSettingImplCopyWith(_$NsecAppSettingImpl value,
          $Res Function(_$NsecAppSettingImpl) then) =
      __$$NsecAppSettingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? nsec1});
}

/// @nodoc
class __$$NsecAppSettingImplCopyWithImpl<$Res>
    extends _$AppSettingCopyWithImpl<$Res, _$NsecAppSettingImpl>
    implements _$$NsecAppSettingImplCopyWith<$Res> {
  __$$NsecAppSettingImplCopyWithImpl(
      _$NsecAppSettingImpl _value, $Res Function(_$NsecAppSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nsec1 = freezed,
  }) {
    return _then(_$NsecAppSettingImpl(
      nsec1: freezed == nsec1
          ? _value.nsec1
          : nsec1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NsecAppSettingImpl extends NsecAppSetting {
  _$NsecAppSettingImpl({this.nsec1, final String? $type})
      : $type = $type ?? 'nsec',
        super._();

  factory _$NsecAppSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NsecAppSettingImplFromJson(json);

  @override
  final String? nsec1;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppSetting.nsec(nsec1: $nsec1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NsecAppSettingImpl &&
            (identical(other.nsec1, nsec1) || other.nsec1 == nsec1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nsec1);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NsecAppSettingImplCopyWith<_$NsecAppSettingImpl> get copyWith =>
      __$$NsecAppSettingImplCopyWithImpl<_$NsecAppSettingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? nsec1) nsec,
    required TResult Function(String? npub1) npub,
  }) {
    return nsec(nsec1);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? nsec1)? nsec,
    TResult? Function(String? npub1)? npub,
  }) {
    return nsec?.call(nsec1);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? nsec1)? nsec,
    TResult Function(String? npub1)? npub,
    required TResult orElse(),
  }) {
    if (nsec != null) {
      return nsec(nsec1);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NsecAppSetting value) nsec,
    required TResult Function(NpubAppSetting value) npub,
  }) {
    return nsec(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NsecAppSetting value)? nsec,
    TResult? Function(NpubAppSetting value)? npub,
  }) {
    return nsec?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NsecAppSetting value)? nsec,
    TResult Function(NpubAppSetting value)? npub,
    required TResult orElse(),
  }) {
    if (nsec != null) {
      return nsec(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NsecAppSettingImplToJson(
      this,
    );
  }
}

abstract class NsecAppSetting extends AppSetting {
  factory NsecAppSetting({final String? nsec1}) = _$NsecAppSettingImpl;
  NsecAppSetting._() : super._();

  factory NsecAppSetting.fromJson(Map<String, dynamic> json) =
      _$NsecAppSettingImpl.fromJson;

  String? get nsec1;
  @JsonKey(ignore: true)
  _$$NsecAppSettingImplCopyWith<_$NsecAppSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NpubAppSettingImplCopyWith<$Res> {
  factory _$$NpubAppSettingImplCopyWith(_$NpubAppSettingImpl value,
          $Res Function(_$NpubAppSettingImpl) then) =
      __$$NpubAppSettingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? npub1});
}

/// @nodoc
class __$$NpubAppSettingImplCopyWithImpl<$Res>
    extends _$AppSettingCopyWithImpl<$Res, _$NpubAppSettingImpl>
    implements _$$NpubAppSettingImplCopyWith<$Res> {
  __$$NpubAppSettingImplCopyWithImpl(
      _$NpubAppSettingImpl _value, $Res Function(_$NpubAppSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? npub1 = freezed,
  }) {
    return _then(_$NpubAppSettingImpl(
      npub1: freezed == npub1
          ? _value.npub1
          : npub1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NpubAppSettingImpl extends NpubAppSetting {
  _$NpubAppSettingImpl({this.npub1, final String? $type})
      : $type = $type ?? 'npub',
        super._();

  factory _$NpubAppSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NpubAppSettingImplFromJson(json);

  @override
  final String? npub1;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppSetting.npub(npub1: $npub1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NpubAppSettingImpl &&
            (identical(other.npub1, npub1) || other.npub1 == npub1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, npub1);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NpubAppSettingImplCopyWith<_$NpubAppSettingImpl> get copyWith =>
      __$$NpubAppSettingImplCopyWithImpl<_$NpubAppSettingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? nsec1) nsec,
    required TResult Function(String? npub1) npub,
  }) {
    return npub(npub1);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? nsec1)? nsec,
    TResult? Function(String? npub1)? npub,
  }) {
    return npub?.call(npub1);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? nsec1)? nsec,
    TResult Function(String? npub1)? npub,
    required TResult orElse(),
  }) {
    if (npub != null) {
      return npub(npub1);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NsecAppSetting value) nsec,
    required TResult Function(NpubAppSetting value) npub,
  }) {
    return npub(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NsecAppSetting value)? nsec,
    TResult? Function(NpubAppSetting value)? npub,
  }) {
    return npub?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NsecAppSetting value)? nsec,
    TResult Function(NpubAppSetting value)? npub,
    required TResult orElse(),
  }) {
    if (npub != null) {
      return npub(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NpubAppSettingImplToJson(
      this,
    );
  }
}

abstract class NpubAppSetting extends AppSetting {
  factory NpubAppSetting({final String? npub1}) = _$NpubAppSettingImpl;
  NpubAppSetting._() : super._();

  factory NpubAppSetting.fromJson(Map<String, dynamic> json) =
      _$NpubAppSettingImpl.fromJson;

  String? get npub1;
  @JsonKey(ignore: true)
  _$$NpubAppSettingImplCopyWith<_$NpubAppSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
