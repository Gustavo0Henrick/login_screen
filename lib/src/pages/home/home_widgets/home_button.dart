import 'package:flutter/material.dart';
import 'package:login_screen/src/core/constants/colors.dart';

FloatingActionButton getHomeButton() {
  return FloatingActionButton(
    heroTag: "buttonA",
    child: Icon(
      Icons.add,
      color: CustomColors.white,
    ),
    onPressed: () {},
  );
}
