import 'package:flutter/material.dart';


class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profile User"),
        ),
        body: Center(
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text("back to home page"),

          ),
        ),
      ),
    );
  }
}
