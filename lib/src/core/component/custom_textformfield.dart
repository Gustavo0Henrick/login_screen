import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  TextEditingController controller;
  Function validator;
  double height;
  TextInputType inputType;

  CustomTextFormField({
    Key key,
    this.controller,
    this.validator,
    this.height = 40,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height + 30,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            height: widget.height,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: EdgeInsets.all(8),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              keyboardType: widget.inputType,
              validator: widget.validator,
              controller: widget.controller,
              cursorHeight: 25,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
