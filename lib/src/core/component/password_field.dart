import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  bool obscure;
  TextEditingController controller;
  Function validator;
  final width;
  TextInputType inputType;

  PasswordField({
    Key key,
    this.obscure,
    this.controller,
    this.validator,
    this.inputType = TextInputType.text,
    this.width,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
        child: TextFormField(
          obscureText: widget.obscure,
          validator: widget.validator,
          cursorHeight: 25,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscure = !widget.obscure;
                  });
                },
                child: widget.obscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility)),
            border: InputBorder.none,
          ),
          controller: widget.controller,
        ),
      ),
    );
  }
}
