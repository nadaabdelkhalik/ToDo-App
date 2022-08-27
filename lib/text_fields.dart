import 'package:flutter/material.dart';

Widget textField1({
  required String text,
  required var prefixicon,
  required var textInputType,
  required var validator,
  var obscure = false,
  var suffixIcon,
  var onTap,
  var controller,
  
}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextFormField(
      decoration: InputDecoration(
          label: Text(text),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          prefixIcon: prefixicon,
          suffixIcon: suffixIcon),
      validator: validator,
      keyboardType: textInputType,
      obscureText: obscure,
      onTap:onTap ,
      controller:controller ,
    ),
  );
}
