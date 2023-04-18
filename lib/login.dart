import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_crud_sederhana/home_page.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/services.dart';
import 'package:flutter_device_identifier/flutter_device_identifier.dart';
// import 'package:flutter_crud_sederhana/main.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _platformVersion = 'Unknown';
  String _serialNumber = "--";
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion = await FlutterDeviceIdentifier.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

    await FlutterDeviceIdentifier.requestPermission();
    _serialNumber = await FlutterDeviceIdentifier.serialCode;
  }

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Implement your login logic here

    print('Logging in with $username and $password');

    // Save the rememberMe checkbox value to shared preferences
    saveSharedPreferences(_rememberMe);
  }
  void loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = prefs.getBool('rememberMe') ?? false;
    setState(() {
      _rememberMe = rememberMe;
    });
  }

  void saveSharedPreferences(bool rememberMe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', rememberMe);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFFE2EBF0),
          // appBar: PreferredSize(
          //   // preferredSize: const Size.fromHeight(80),
          //   // child: Padding(
          //   //   padding: const EdgeInsets.all(20.0),
          //   //   child: AppBar(
          //   //     leading: Image.asset('assets/images/logo.png'),
          //   //     title: const Text(
          //   //       "PT. Deta Sumber Makmur",
          //   //       style: TextStyle(color: Color(0xFF0950A2), fontSize: 10),
          //   //     ),
          //   //     elevation: 0,
          //   //     actions: <Widget>[
          //   //       IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          //   //     ],
          //   //     flexibleSpace: Container(
          //   //       decoration: const BoxDecoration(color: Color(0xFFE2EBF0)),
          //   //     ),
          //   //   ),
          //   // ),
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 40),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 72,
                          height: 72,
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/images/image_login.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'MASUK',
                        style:
                            TextStyle(color: Color(0xFF0950A2), fontSize: 32),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Silakan masuk ke akun Anda yang sudah terdaftar',
                        style:
                            TextStyle(color: Color(0xFF7F838B), fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      // prefixIcon: Icon(Icons.account_box_sharp),
                      labelText: 'Username',
                      hintText: "Masukan NIP anda",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDBBA6B)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD1D2D2)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // membuat teks menjadi bintang
                    decoration: const InputDecoration(
                      // prefixIcon: Icon(Icons.account_box_sharp),
                      labelText: 'Password',
                      hintText: "Masukan Password anda",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDBBA6B)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD1D2D2)),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const Text(
                        'Ingat Saya',
                        style: TextStyle(fontSize: 16),
                      ),

                      Expanded(
                        child: Container(),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Tindakan ketika "Lupa Password" diklik
                        },
                        child: const Text(
                          'Lupa Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const MyHomePage();
                            }));
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Text('Running on: $_platformVersion\n'),
                        // Text('Serial No: $_serialNumber')
                        // String imei = await ImeiPlugin.getImei;
                        print('Running on: $_platformVersion\n');
                        print('Serial No: $_serialNumber');
                      },
                      child: const Text('Cek Imei'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
// ElevatedButton(
//   // onPressed: _handleLogin,
//   onPressed: () {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) {
//       return MyHomePage();
//     }));
//   },
//   child: const Text('Login'),
// ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

//             body: Center(
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return const MyHomePage();
//                     }));
//                   },
//                   child: const Text("goto home page")),
//             )));
//   }
// }
