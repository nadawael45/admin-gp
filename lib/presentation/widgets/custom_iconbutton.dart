import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBtnIcon extends StatelessWidget {
  Widget? icon;
  var function;
  Color? color;
  double? width;
  double? height;


  CustomBtnIcon({this.icon, this.function,this.color,this.width=40,this.height=40});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),
        width: width,
        height: height,
        child: icon,




          ),
    );
  }
}
