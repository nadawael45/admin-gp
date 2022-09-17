import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  bool readonly;
  Widget? suffixIcon;
  var keyBoardType;
  var controller;
  var validate;
  var function;
  var onTap;
  String? text;
  CustomTextFormField({ this.hintText,this.controller,this.onTap,this.text,
       this.validate,this.function,this.keyBoardType,this.suffixIcon,
    this.readonly=false,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[200],
          child: TextFormField(

            validator: validate,
            controller: controller,
            readOnly:  readonly,
            keyboardType: keyBoardType,
            decoration: InputDecoration(

              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 3.0,),
                borderRadius: BorderRadius.circular(10),
              ) ,
              hintText: hintText!,
              suffixIcon: suffixIcon
                ,
              hintStyle: GoogleFonts.tajawal(

                color: grey,
                fontSize: 11.sp,







              )),



          ),
        ),
      ],
    );
  }
}
