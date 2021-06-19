import 'package:flutter/material.dart';
import 'package:login_screen/src/core/constants/colors.dart';
import 'package:login_screen/src/pages/home/home_widgets/home_item_model.dart';

class HomeItems extends StatefulWidget {
  final HomeItemModel homeItemModel;
  HomeItems({this.homeItemModel});

  @override
  _HomeItemsState createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.darkOrange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: CustomColors.deepIce,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      widget.homeItemModel.icon,
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          widget.homeItemModel.title,
                          style: TextStyle(
                            color: CustomColors.darkOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.delete,
                    color: CustomColors.red,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
