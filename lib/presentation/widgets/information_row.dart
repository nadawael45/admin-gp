import 'package:flutter/material.dart';

import '../../shared/constants/colors.dart';
import 'custom_button.dart';
import 'custom_text.dart';
import 'oreder_item.dart';

class InfoRow extends StatelessWidget {
  InfoRow({
    Key? key,
    this.phone,
    this.text,this.widget,this.iconData
  }) : super(key: key);
  var phone;
  String? text;
  IconData? iconData;
  bool? widget=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(iconData,color: primaryColor,),
          const SizedBox(width: 10,),
          CustomText(text: text,),
          const Spacer(),
          widget==true?CustomButton('Call Customer',()=> makePhoneCall(phone),
            textColor: primaryColor,btnColor: white,txtSize: 8,height: 30,width: 80,):
          const SizedBox(),
        ],
      ),
    );
  }
}
