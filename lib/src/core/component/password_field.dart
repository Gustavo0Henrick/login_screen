import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  bool password;
  TextEditingController controller;
  Function validator;
  double height;
  TextInputType inputType;

  PasswordField({
    Key key,
    this.password,
    this.controller,
    this.validator,
    this.height = 40,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
            padding: EdgeInsets.only(left: 5, right: 5),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              keyboardType: widget.inputType,
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.password,
              cursorHeight: 25,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.password = !widget.password;
                      });
                    },
                    enableFeedback: widget.password,
                    child: Icon(
                      widget.password ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
