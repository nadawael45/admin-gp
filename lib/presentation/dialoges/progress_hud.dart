import 'package:admingp/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';
class HudWidget extends StatelessWidget {
  const HudWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(height: 150,width: 200,

      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10) ),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          const SizedBox(height: 35,width: 35,

              child: CircularProgressIndicator(color: primaryColor,)),

          const SizedBox(height: 25,),

          CustomText(text: 'Loading...',color: Colors.black,textDecoration: TextDecoration.none,fontWeight: FontWeight.normal,txtSize: 14,)

        ],

      ),);
  }
}
