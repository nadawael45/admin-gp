import 'package:admingp/domain/cubit/orders/order_cubit.dart';
import 'package:admingp/domain/cubit/orders/order_states.dart';
import 'package:admingp/presentation/widgets/oreder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,OrderStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        print('kkkkkkkkkkkkkkkkkkkkkkk');
        print(OrderCubit.get(context).orderNewUserList.length);
        return ListView.builder(
            itemCount: OrderCubit.get(context).orderNewUserList.length,
            itemBuilder: (context,index){
              return OrderItem(
                isdone: true,
                userList: OrderCubit.get(context).orderNewUserList,

                deleteFunc: (){
                  OrderCubit.get(context).delete(OrderCubit.get(context).orderNewUserList[index].date);

                },

                doneFunc:(){
                  OrderCubit.get(context).done(OrderCubit.get(context).orderNewUserList[index].date);
                } ,
                phone: OrderCubit.get(context).orderNewUserList[index].phone,
                name:OrderCubit.get(context).orderNewUserList[index].name ,
                date: OrderCubit.get(context).orderNewUserList[index].date,
                total:OrderCubit.get(context).orderNewUserList[index].total ,
                comment: OrderCubit.get(context).orderNewUserList[index].comment,
                userListIndex: OrderCubit.get(context).orderNewUserList[index],



              );
            });
      },
    );
  }
}
