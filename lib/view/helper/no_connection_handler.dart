import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class NoConnectionHandler {
  late StreamSubscription<ConnectivityResult> subscription;
  late BuildContext context;

  void init(BuildContext context) {
    this.context = context;
    subscription = Connectivity().onConnectivityChanged.listen(_handleConnectionChange);
  }

  void _handleConnectionChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      _showNoConnection();
    }
  }

  void _showNoConnection() {
    if (ModalRoute.of(context)?.settings.name != '/no-connection') {
      Navigator.of(context).pushNamed('/no-connection');
    }
  }

  void dispose() {
    subscription.cancel();
  }
}
