

import 'package:flutter/material.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  State<NoConnection> createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding( padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.signal_wifi_off,
                size: 64.0,
                color: Colors.grey[500],
              ),
              const SizedBox(height: 16.0),
              Text(
                'No internet connection',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
