import 'package:flutter/material.dart';
import 'package:login_screen/src/core/constants/colors.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text("Loja"),
    centerTitle: true,
    backgroundColor: CustomColors.deepOrange,
    // leading: IconButton(
    //   onPressed: () {},
    //   icon: Icon(
    //     Icons.menu,
    //     color: CustomColors.white,
    //   ),
    // ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.more_vert_rounded,
          color: CustomColors.white,
        ),
        onPressed: () {},
      ),
    ],
  );
}
