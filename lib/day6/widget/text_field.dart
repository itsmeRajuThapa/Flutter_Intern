import 'package:flutter/material.dart';

Widget textform(
    {required String labeltext,
    required String hint,
    controller,
    validate,
    keyType}) {
  return TextFormField(
    controller: controller,
    validator: validate,
    keyboardType: keyType,
    decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: TextStyle(color: Colors.purple, fontSize: 16),
        hintText: hint,
        disabledBorder: InputBorder.none,
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        border: OutlineInputBorder()),
  );
}
