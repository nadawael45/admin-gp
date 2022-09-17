import 'package:flutter/material.dart';

class UserTheme{
  static get({required context ,required fontSize , required fontWight ,required colorBright ,required colorDark}){
    return TextStyle(
      fontFamily: 'Tajawal',
      fontSize: fontSize,
      fontWeight: fontWight,
      color: colorBright,
    );
  }
}