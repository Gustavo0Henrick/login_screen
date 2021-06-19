import 'package:flutter/material.dart';
import 'package:login_screen/src/core/constants/colors.dart';
import 'package:login_screen/src/pages/home/home_widgets/home_item_model.dart';
import 'package:login_screen/src/pages/home/home_widgets/home_items.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<HomeItemModel> list = [
    HomeItemModel(
      title: "Nome Teste 1",
      icon: Icon(Icons.airplanemode_active),
    ),
    HomeItemModel(
      title: "Nome Teste 2",
      icon: Icon(Icons.airplanemode_active),
    ),
    HomeItemModel(
      title: "Nome Teste 3",
      icon: Icon(Icons.airplanemode_active),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return HomeItems(
              homeItemModel: list[index],
            );
          },
        ));
  }
}
