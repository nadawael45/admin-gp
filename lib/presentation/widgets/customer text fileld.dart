import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';

// ignore: must_be_immutable
class CustomerTextField extends StatefulWidget {
  static var code = "+20";
  late String hint ;
  bool secure = false;
  bool isSecure = false;
  TextEditingController? controller;
  IconData? suffixIconData , prefixIconData;
  // ignore: prefer_typing_uninitialized_variables
  var validator , onSaved  ;
  CustomerTextField(
      {Key? key,
        required this.hint,
        required this.secure,
        this.prefixIconData,
        this.suffixIconData,
        this.controller,
        this.onSaved,
        this.validator,
      }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CustomerTextFieldState createState() => _CustomerTextFieldState();
}

class _CustomerTextFieldState extends State<CustomerTextField> {
  _CustomerTextFieldState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.sp),
          decoration: BoxDecoration(
              border: Border.all(
                //width: 1.sp,
                  color: Colors.grey.shade400
              ),
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.sp)
          ),
          height: 50.sp,
          child: TextFormField(
            controller: widget.controller,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 13.sp,
                color: Colors.black,
              ) ,
              cursorColor: Colors.grey,
              onSaved: widget.onSaved,
              validator: widget.validator,
              obscureText: widget.secure ? widget.isSecure : widget.secure,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13.sp,
                  color: Colors.grey.shade700,
                ) ,
                suffixIcon: widget.secure? Padding(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.all(2),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        widget.isSecure = !widget.isSecure;
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye ,
                      color: primaryColor,
                      size: 20.sp,
                    ),
                  ),
                ) : null,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              )
          )
      ),
    );
  }
}