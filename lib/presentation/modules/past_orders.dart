import 'package:admingp/domain/cubit/orders/order_cubit.dart';
import 'package:admingp/domain/cubit/orders/order_states.dart';
import 'package:admingp/presentation/widgets/oreder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PastOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,OrderStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        print('kkkkkkkkkkkkkkkkkkkkkkk');
        print(OrderCubit.get(context).orderPastUserList.length);
        return ListView.builder(
            itemCount: OrderCubit.get(context).orderPastUserList.length,
            itemBuilder: (context,index){
//
              return OrderItem(

                deleteFunc: (){
                  OrderCubit.get(context).delete(OrderCubit.get(context).orderPastUserList[index].date);

                },

                isdone: false,
                phone: OrderCubit.get(context).orderPastUserList[index].phone,
                name:OrderCubit.get(context).orderPastUserList[index].name ,
                date: OrderCubit.get(context).orderPastUserList[index].date,
                total:OrderCubit.get(context).orderPastUserList[index].total! ,
                comment: OrderCubit.get(context).orderPastUserList[index].comment,
                userListIndex: OrderCubit.get(context).orderPastUserList[index],
                userList: OrderCubit.get(context).orderPastUserList,


              );
            });
      },
    );
  }
}
