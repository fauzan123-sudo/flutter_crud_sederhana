

import 'package:flutter/material.dart';

class ListPermissions extends StatefulWidget {
  const ListPermissions({Key? key}) : super(key: key);

  @override
  State<ListPermissions> createState() => _ListPermissionsState();
}

class _ListPermissionsState extends State<ListPermissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
    );
  }
}

