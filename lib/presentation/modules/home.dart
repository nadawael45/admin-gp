import 'package:admingp/data/models/product.dart';
import 'package:admingp/domain/cubit/dropdown/dropdown_cubit.dart';
import 'package:admingp/domain/cubit/orders/order_cubit.dart';
import 'package:admingp/domain/cubit/product/product_cubit.dart';
import 'package:admingp/presentation/modules/add.dart';
import 'package:admingp/presentation/modules/new_orders.dart';
import 'package:admingp/presentation/modules/past_orders.dart';
import 'package:admingp/presentation/modules/show_products.dart';
import 'package:admingp/presentation/widgets/custom_text.dart';
import 'package:admingp/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/cubit/orders/order_states.dart';
import '../widgets/custom_badge.dart';
class Home extends StatelessWidget {
   const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroungd,
      appBar: AppBar(

        backgroundColor: primaryColor,
        centerTitle: true,
        title:CustomText(text: 'Electronics',fontWeight: FontWeight.bold,color:white,),

      ),
      body:  DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Card(

              color: white,
              child: TabBar(
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
                labelColor: primaryColor,
                labelPadding: const EdgeInsets.all(8),
                padding: const EdgeInsets.only(top:15),
                indicatorColor: primaryColor,
                unselectedLabelColor: black,
                onTap: (index){
                 if(index==3) {
                   print('llllllllllllllllllllllllllllll');
                   //print(ProductCubit.get(context).getProduct(DropDownCubit.get(context).dropDownValue));
                   ProductCubit.get(context).getProduct(DropDownCubit.get(context).dropDownValue);
                 }
                },


                tabs: [
                  Row(
                    children: [
                      CustomText(text: 'New\nOrders',fontWeight: FontWeight.bold,textAlign: TextAlign.start),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5,bottom: 5),
                        child: BlocBuilder<OrderCubit,OrderStates>(
                            builder: (context,state) {
                              if(state is GetPastUsersInformSuccess){
                                OrderCubit.get(context).orderNewUserList;
                                print(OrderCubit.get(context).orderNewUserList);
                              }
                            return Custom_badge(list: OrderCubit.get(context).orderNewUserList,);
                          }
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(text: 'Past\nOrders',fontWeight: FontWeight.bold,textAlign: TextAlign.start),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5,bottom: 5),
                        child: BlocBuilder<OrderCubit,OrderStates>(
                            builder: (context,state) {
                              if(state is GetPastUsersInformSuccess){
                                OrderCubit.get(context).orderPastUserList;
                                print(OrderCubit.get(context).orderPastUserList);
                              }
                            return Custom_badge(list: OrderCubit.get(context).orderPastUserList,);
                          }
                        ),
                      )

                    ],
                  ),
                  CustomText(text: 'Add\nProduct',fontWeight: FontWeight.bold,textAlign: TextAlign.start,),
                  CustomText(text: 'Show\nProducts',fontWeight: FontWeight.bold,textAlign: TextAlign.start),




                ],),
            ),
            Expanded(
              child: TabBarView(children: [
                NewOrders(),
                PastOrders(),
                Add(),
                ProductWidgetHome()


              ],),
            ),
          ],
        ),
      ),
    );
  }
}

