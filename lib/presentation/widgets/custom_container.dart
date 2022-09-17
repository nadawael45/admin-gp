import 'package:admingp/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({
    Key? key,
    required this.text,required this.function

  }) : super(key: key);
  var function;
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: const EdgeInsets.all(50),
      child: CustomButton(text, function,
        txtSize: 50,
        gradient:  LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade600,
              primaryColor,
              Colors.blue.shade100,
            ]
        ),
      ),
    ));
  }
}
