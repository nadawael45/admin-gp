import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';
import 'custom_text.dart';
class CustomButton extends StatelessWidget {
  String? text;
  var function;
  Color borderColor;
  Color textColor;
  Color btnColor;
 double? height;
 double?width;
 double? txtSize;
 Gradient? gradient;

  CustomButton(this.text, this.function,{this.borderColor=primaryColor,this.textColor=Colors.white,
    this.btnColor=primaryColor,this.height,this.txtSize,this.width,this.gradient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width:width?? MediaQuery.of(context).size.width,
           height: height??42.sp,
           decoration: BoxDecoration(
             color: btnColor,
             border: Border.all(color: borderColor),
             borderRadius: BorderRadius.circular(10),
             gradient: gradient

           ),
          child: Center(
            child: CustomText(text: text,fontWeight: FontWeight.bold,color: textColor,txtSize: txtSize??12.sp,
            ),
          )),
    );
  }
}
