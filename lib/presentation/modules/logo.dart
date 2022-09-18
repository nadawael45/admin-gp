import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';
import '../widgets/customer text.dart';
class LOGO extends StatelessWidget {
  const LOGO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                      "Electronics",
                      textStyle: TextStyle(
                          fontSize: 25.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {

                },
              ),
            ),
            CustomText(
              text: "Welcome to Electronics App",
              color: primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ],
        ),
      );
  }
}
