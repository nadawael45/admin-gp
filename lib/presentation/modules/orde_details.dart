import 'package:admingp/presentation/widgets/custom_button.dart';
import 'package:admingp/presentation/widgets/oreder_item.dart';
import 'package:admingp/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/cubit/orders/order_cubit.dart';
import '../../domain/cubit/orders/order_states.dart';
import '../widgets/custom_text.dart';
import '../widgets/information_row.dart';
class OrderDetails extends StatelessWidget {
  var userListIndex;
  var userList;
  OrderDetails(this.userListIndex,this.userList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Container(color: Colors.blue.shade100,child: Padding(
            padding: const EdgeInsets.all(12),
            child: UserRow(name: userListIndex.name, date: userListIndex.date,list: OrderCubit.get(context).myOrderCubit
                ,visible: true,
                badge: false,
                total:userListIndex.total),
          ),
          ),
          InfoRow(text: userListIndex.phone,iconData: Icons.phone,widget: true,phone: userListIndex.phone,),
          Divider(color: Colors.grey.shade300,thickness: 1,),
          InfoRow(text: userListIndex.location,iconData: Icons.location_on,),
          Divider(color: Colors.grey.shade300,thickness: 1,),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CustomText(text: 'Comment',fontWeight: FontWeight.bold,txtSize: 14,),
              SizedBox(height: 5,),
              CustomText(text: userListIndex.comment,txtSize: 11,),

            ],),
          ),
            Divider(color: Colors.grey.shade300,thickness: 1,),
            Padding(
              padding: const EdgeInsets.all( 12),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(text: 'No.',fontWeight: FontWeight.bold,),
                  CustomText(text: 'Items',fontWeight: FontWeight.bold,),
                CustomText(text: 'price',fontWeight: FontWeight.bold,),

              ],),
            ),


            Expanded(
            child: Container(
              color: white,
              width: double.infinity,
              child: BlocConsumer<OrderCubit,OrderStates>(
                  listener: (BuildContext context, state) {  },
                  builder: (BuildContext context, state) {
                    print(OrderCubit.get(context).myOrderCubit.length);
                    if(state is GetOrderSuccess){
                      return ListView.builder(
                          itemCount: OrderCubit.get(context).myOrderCubit.length,
                          itemBuilder: (context,index){
                            return  Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(textAlign: TextAlign.start,
                                              text:'${index+1}'),

                                          CustomText(textAlign: TextAlign.start,
                                              text:OrderCubit.get(context).myOrderCubit[index].orderName),

                                          CustomText(
                                              text:'${OrderCubit.get(context).myOrderCubit[index].price}'+" JD",textAlign: TextAlign.start,),

                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                                Divider(color: Colors.grey.shade300,thickness: 1,),

                              ],
                            );

                          });

                    }else{
                      return SizedBox();
                    }
                  }
              ),
            ),
          ),
            Container(
              color: white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(children: [
                  Expanded(child: CustomButton('Delete Order',
                      (){
                        OrderCubit.get(context).delete(userListIndex.date);

                      },
                      borderColor: Colors.red,btnColor: Colors.red,txtSize: 10,height: 35)),
                  SizedBox(width: 6,),
                  userList==OrderCubit.get(context).orderNewUserList?
                  Expanded(child: CustomButton('Done Order',
                      (){
                        OrderCubit.get(context).done(userListIndex.date);
                        Navigator.pop(context);

                      }

                      ,borderColor: Colors.green,btnColor: Colors.green,txtSize: 10,height: 35)):
                  const SizedBox()
                ],),
              ),
            )

        ],),
      ),
    );
  }
}

