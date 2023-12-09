import 'package:flustr/controller/relay_url_provider.dart/relay_url_provider.dart';
import 'package:flustr/external/connection_pool.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connection_pool_provider.g.dart';

@Riverpod(keepAlive: true)
ConnectionPool? connectionPool(ConnectionPoolRef ref) {
  final rawUrls = ref.watch(relayUrlProvider);
  final urls = switch (rawUrls) {
    AsyncData(:final value) => value,
    _ => null,
  };
  print('urls: $urls');
  if (urls == null) return null;
  return ConnectionPool(urls);
}
