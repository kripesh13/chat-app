import 'package:flutter/material.dart';

import '../constant/constant.dart';

TextField customTextField(
    {String? labelText,
    bool? obscure,
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputType? keyboardType,
    FocusNode ?focusNode,
    required TextEditingController controller}) {
  return TextField(
    keyboardType:  keyboardType ??  TextInputType.text ,
    controller: controller,
    focusNode: focusNode,
    obscureText: obscure ?? false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 10,right: 5,bottom: 5,top: 5),
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
           borderSide: BorderSide(color: primaryColor,width: 1)
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon),
  );
}
