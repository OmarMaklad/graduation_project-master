import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool secure;
  final Function validate;
  final Function onSave;

  CustomTextField({this.hint, this.secure, this.validate, this.onSave});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextFormField(
        onSaved: onSave,
        validator: validate,
        obscureText: secure,
        decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.all(5),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
