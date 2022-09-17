import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../domain/cubit/orders/order_cubit.dart';
import '../../domain/cubit/orders/order_states.dart';
import '../../shared/constants/colors.dart';
import 'custom_text.dart';
class Custom_badge extends StatelessWidget {
  var list;
  Custom_badge({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


          return Badge(
            badgeColor: primaryColor,
            badgeContent: Center(child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: CustomText(text: list.length.toString()
                ,color: Colors.white,txtSize: 7.sp,),
            )),);

  }
}
