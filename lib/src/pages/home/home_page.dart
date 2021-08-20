import 'package:flutter/material.dart';
import 'package:login_screen/src/core/themes/colors.dart';
import 'package:login_screen/src/pages/home/home_widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loja"),
        centerTitle: true,
        backgroundColor: CustomColors.darkOrange,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: CustomColors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: getHomeDrawer(),
      floatingActionButton: FloatingActionButton(
        heroTag: "buttonA",
        child: Icon(
          Icons.add,
          color: CustomColors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
