import 'package:flutter/material.dart';
import 'package:login_screen/src/pages/home/home_widgets/home_appbar.dart';
import 'package:login_screen/src/pages/home/home_widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(),
    );
  }
}
