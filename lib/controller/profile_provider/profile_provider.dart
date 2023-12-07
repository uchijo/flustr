import 'dart:convert';

import 'package:flustr/external/connection_pool.dart';
import 'package:flustr/external/subscription.dart';
import 'package:nostr/nostr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_provider.freezed.dart';
part 'profile_provider.g.dart';

// run this to generate code
// dart run build_runner build

@freezed
class ProfileData with _$ProfileData {
  factory ProfileData({
    required String name,
    required String picture,
    required String about,
    required String pubHex,
  }) = _ProfileData;

  const ProfileData._();

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
  factory ProfileData.fromEvent(Event event) {
    if (event.kind != 0) {
      throw Exception('expected kind0, but got non-kind0');
    }
    final eventMap = jsonDecode(event.content) as Map<String, dynamic>;
    return ProfileData(
      name: eventMap['name'] ?? 'undefined',
      picture: eventMap['picture'] ?? '',
      about: eventMap['about'] ?? '',
      pubHex: event.pubkey,
    );
  }
}

@riverpod
FutureOr<ProfileData> profile(ProfileRef ref, String pubHex) async {
  // return fetchProfile(pool, pubHex);
  return ProfileData(
    name: 'uchijo',
    picture: 'https://www.uchijo.com/icon.jpg',
    pubHex: 'e62f27d2814a25171c466d2d7612ad1a066db1362b4e259db5c076f9e6b21cb7',
    about: 'おいも おいも',
  );
}

Future<ProfileData?> fetchProfile(ConnectionPool pool, String pubHex) async {
  final events = await pool.getStoredEvent([
    Filter(authors: [pubHex], kinds: [0], limit: 1),
  ]);

  // パースで死ぬことを考慮
  try {
    if (events.length == 1) {
      return ProfileData.fromEvent(events.first);
    }
  } catch (_) {}
  return null;
}
