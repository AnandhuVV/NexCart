import 'dart:io';
import 'dart:async'; // Required for TimeoutException
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityGuard {
  ConnectivityGuard(this._connectivity);

  final Connectivity _connectivity;

  Stream<bool> get onStatusChanged {
    return _connectivity.onConnectivityChanged.asyncMap((_) => isConnected());
  }

  Future<bool> isConnected() async {
    final connectivityResults = await _connectivity.checkConnectivity();

    // Returns the network transport methods
    final hasTransport = connectivityResults.any(
      (result) => result != ConnectivityResult.none,
    );

    // No internet access if no transport method is available
    if (!hasTransport) return false;

    try {
      final result = await InternetAddress.lookup(
        'example.com',
      ).timeout(const Duration(seconds: 3));

      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      // Standard network failure
      return false;
    } on TimeoutException catch (_) {
      // Captive Portal / Hanging Network trap
      return false;
    } catch (_) {
      return false;
    }
  }
}
