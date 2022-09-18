import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';

class UserButton extends StatelessWidget {
  String? title ;
  var onClick ;
  Color? colorTxt;
  Color colorBtn;
  double? height;
  double? width;
  double?fontSize;



  UserButton({Key? key , required this.title , required this.onClick,
    this.colorBtn= primaryColor,
    this.colorTxt,
    this.height,this.width,this.fontSize

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Center(
        child: Container(
          width: width?? MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(
              color: colorBtn,
              borderRadius: BorderRadius.circular(10.sp)
          ),
          height: height?? 50.sp,
          child: Center(
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize:fontSize?? 15.sp,
                  color:colorTxt?? white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}