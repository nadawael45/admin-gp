import 'package:ecommerce/domain/cubit/product/product_cubit.dart';
import 'package:ecommerce/presentation/modules/add_category.dart';
import 'package:ecommerce/presentation/modules/add_menu.dart';
import 'package:ecommerce/presentation/widgets/custom_button.dart';
import 'package:ecommerce/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_container.dart';
class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroungd,
      body: Column(children: [
        CustomContainer(text:'Add\n  Product' ,function:
            (){
          ProductCubit.get(context).image=null;
          ProductCubit.get(context).imageUrl=null;

          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMenu()));
        },
          ),
        CustomContainer(text:'Add\n  Category' ,function:
            (){
          ProductCubit.get(context).image=null;
          ProductCubit.get(context).imageUrl=null;

          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCategory()));
        },
        ),

      ],),
    );
  }
}

