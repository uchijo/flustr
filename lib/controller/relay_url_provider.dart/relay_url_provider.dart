import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'relay_url_provider.g.dart';

@riverpod
Future<List<String>> relayUrl(RelayUrlRef ref) async {
  return ['wss://relay-jp.nostr.wirednet.jp/', 'wss://relay.damus.io'];
}
