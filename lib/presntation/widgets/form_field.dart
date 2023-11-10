import 'package:flutter/material.dart';

Widget defualtFormField({
  required TextEditingController controller,
  required Function validate,
  required String label,
  required TextInputType type,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      obscureText: isPassword,
      keyboardType: type,
      validator: (String? s) {
        return validate(s);
      },
      controller: controller,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(suffix)),
          suffixIconColor: Colors.black,
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          label: Text(label),
          labelStyle: const TextStyle(
            fontSize: 18,
          )),
    );
