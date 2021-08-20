import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  TextEditingController controller;
  Function validator;
  final width;
  TextInputType inputType;

  CustomTextFormField({
    Key key,
    this.controller,
    this.validator,
    this.inputType = TextInputType.text,
    this.width,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: TextFormField(
          keyboardType: widget.inputType,
          validator: widget.validator,
          cursorHeight: 25,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          controller: widget.controller,
        ),
      ),
    );
  }
}
