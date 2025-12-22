import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  /// Returns true if device is connected
  Future<bool> get isConnected;

  Future<List<ConnectivityResult>> get connectionStatus;

  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}
