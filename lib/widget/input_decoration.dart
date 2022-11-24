
import 'package:flutter/material.dart';

import '../Themes/colors.dart';

InputDecoration InputDecorationWidget (context, labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
    contentPadding: new EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    enabledBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: Colors.black, width: 1),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: kColorPurple, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: kColorRed, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: kColorRed, width: 2),
    ),

    errorStyle: Theme.of(context).textTheme.bodyText1
  );
}