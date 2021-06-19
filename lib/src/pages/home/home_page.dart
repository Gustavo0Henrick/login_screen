import 'package:flutter/material.dart';
import 'package:login_screen/src/pages/home/home%20widgets/home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text("Teste"),
            ),
          ),
        ],
      ),
    );
  }
}
