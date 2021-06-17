import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  bool password;
  TextEditingController controller;
  PasswordField({
    Key key,
    this.password,
    this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      height: 40,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.password,
          cursorHeight: 25,
          decoration: InputDecoration(
            suffixIcon: InkWell(
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
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
