import 'package:connectivity_plus/connectivity_plus.dart';
import 'network_info.dart';
import 'dart:async';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity();

  @override
  Future<bool> get isConnected async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != [ConnectivityResult.none];
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<ConnectivityResult>> get connectionStatus async {
    try {
      return await _connectivity.checkConnectivity();
    } catch (_) {
      return [ConnectivityResult.none];
    }
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
