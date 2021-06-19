import 'package:flutter/material.dart';
import 'package:login_screen/src/core/constants/colors.dart';

AppBar getHomeAppBar() {
  return AppBar(
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
  );
}
