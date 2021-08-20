import 'package:flutter/material.dart';
import 'package:login_screen/src/pages/home/home_page.dart';

import 'package:login_screen/src/pages/login/login_page.dart';
import 'package:login_screen/src/pages/register/register_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/register": (context) => RegisterPage(),
      },
    );
  }
}
