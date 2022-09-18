import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final  String? text;
  final  Color? color;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign? align;
  final double? height;
  final TextDirection? textDirection;

  const  CustomText(
      {Key? key,
        this.textDirection,
        this.height,
        this.align,
        required this.text,
        this.color = Colors.black,
        this.fontSize,
        this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textDirection: textDirection?? TextDirection.rtl,
      style: TextStyle(
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: align??TextAlign.center,
    );
  }
}