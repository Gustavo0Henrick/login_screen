import 'package:flutter/material.dart';
import 'package:login_screen/src/core/constants/colors.dart';

Drawer getHomeDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: CustomColors.deepOrange,
          ),
          accountEmail: Text(
            "teste@teste",
            style: TextStyle(color: CustomColors.white),
          ),
          accountName: Text(
            'name',
            style: TextStyle(
                color: CustomColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: CustomColors.white,
            child: Text(
              "T",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
        ListTile(
          title: Text("Configurações"),
          leading: Icon(
            Icons.settings,
            color: CustomColors.deepOrange,
          ),
        ),
        ListTile(
          title: Text("Sair"),
          leading: Icon(
            Icons.logout,
            color: CustomColors.deepOrange,
          ),
        ),
      ],
    ),
  );
}
