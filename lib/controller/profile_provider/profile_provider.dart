import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_provider.freezed.dart';
part 'profile_provider.g.dart';

// run this to generate code
// dart run build_runner build

@freezed
class ProfileData with _$ProfileData {
  factory ProfileData({
    required String username,
    required String icon,
    required String about,
    required String pubHex,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@riverpod
FutureOr<ProfileData> profile(ProfileRef ref) {
  return ProfileData(
    username: 'uchijo',
    icon: 'https://www.uchijo.com/icon.jpg',
    pubHex: 'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
    about: 'おいも おいも',
  );
}
