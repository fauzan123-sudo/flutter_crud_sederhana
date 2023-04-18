import 'package:flutter/material.dart';
import 'package:flutter_crud_sederhana/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0950A2),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 0),
            child: AppBar(
              leading: Image.asset('assets/images/logo.png'),
              title: const Text(
                "PT. Deta Sumber Makmur",
                style: TextStyle(color: Color(0xFF0950A2), fontSize: 10),
              ),
              elevation: 0,
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
              ],
              flexibleSpace: Container(
                decoration: const BoxDecoration(color: Color(0xFFE2EBF0)),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 240,
                color: Colors.black,
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Image.asset('assets/images/image_login.png'),
              ),
              Container(
                height: 10,
              ),
              Container(
                child: Text(
                  "MASUK",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                child: Text(
                  "Silakan masuk ke akun Anda yang sudah terdaftar",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Container(
                height: 10,
              ),
              const SizedBox(
                height: 49,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFEEA886), width: 0.5),
                    ),
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 49,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFEEA886), width: 0.5),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                // onPressed: _handleLogin,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const MyHomePage();
                      }));
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
