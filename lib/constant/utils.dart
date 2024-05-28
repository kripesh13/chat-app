import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusNode(
      BuildContext context, FocusNode nextFocues, FocusNode currentFocues) {
    currentFocues.unfocus();
    FocusScope.of(context).requestFocus(nextFocues);
  }
}
