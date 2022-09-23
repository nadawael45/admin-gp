import 'dart:async';
import 'package:ecommerce/data/models/order_user_information.dart';
import 'package:ecommerce/data/repo/order_repo.dart';
import 'package:ecommerce/domain/cubit/orders/order_states.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/myOrders.dart';
import '../../../presentation/dialoges/toast.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(LoadingOrder());

  static OrderCubit get(context) => BlocProvider.of(context);

FirebaseFirestore firestor=FirebaseFirestore.instance;
FirebaseAuth auth=FirebaseAuth.instance;
  late  StreamSubscription<List<OrderUserModel>>subscriptionnew;
  late  StreamSubscription<List<OrderUserModel>>subscriptionpast;

  List<OrderUserModel>orderNewUserList=[];
  List<OrderUserModel>orderPastUserList=[];



  List<MyOrdersModel> myOrderCubit=[];



  getNewUsersOrders(){

    emit((LoadingOrder()));
    subscriptionnew=
    OrderRepo().getNewUsersOrders().listen((event) {

      orderNewUserList=event;
      emit(GetUsersInformSuccess());
       //showToast(msg: 'getUserOrder', state: ToastedStates.SUCCESS);
    }
    )

      ..onError((onError) {
        emit(GetUsersInformFailed());
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        print(onError);
      });

  }
  getPastUsersOrders(){

    emit((LoadingOrder()));
    subscriptionpast=
    OrderRepo().getPastUsersOrders().listen((event) {

      orderPastUserList=event;
      emit(GetPastUsersInformSuccess());
      //showToast(msg: 'getUserOrder', state: ToastedStates.SUCCESS);
    }
    )

      ..onError((onError) {
        emit(GetPastUsersInformFailed());
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        print(onError);
      });

  }


  getOrders(userId,date){
    OrderRepo myOrderRepo=OrderRepo(myorderList: myOrderCubit);
    myOrderRepo.getAllOrderItems(userId,date).then((val){
      myOrderCubit=val;
      emit(GetOrderSuccess());
      print('sssssssssssssssssssssssssssssssssss');
      print(myOrderCubit.length);

    }).catchError((onError){
      emit(GetOrderFailed());
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);
      print(onError);
    });

  }



  done(id)async{
  await  firestor.collection('UsersInformation').doc(id).update({
    'state':'done',
  }).then((value) => {

      showToast(msg: 'done', state: ToastedStates.SUCCESS),
    print('dooooooooooooooooooooooooooooooooooooooooone'),
  })
      .catchError((onError) {
        print('lllllllllllllllllllllllll');
    print(onError);

    showToast(msg: onError.toString(), state: ToastedStates.WARNING);
  });




  }

  delete(id)async{
    await  firestor.collection('UsersInformation').doc(id).delete().then((value) => {

      showToast(msg: 'delete', state: ToastedStates.SUCCESS),
      print('dooooooooooooooooooooooooooooooooooooooooone'),
    }).catchError((onError) {
      print(onError);
      showToast(msg: onError.toString(), state: ToastedStates.WARNING);
    });
 var snapshot= await firestor.collection('Orders').where('date',isEqualTo: id).get();

 for(var element in snapshot.docs){
   await element.reference.delete().then((value) => {
   showToast(msg: 'delete', state: ToastedStates.SUCCESS),

   }).onError((error, stackTrace) => {
   showToast(msg: onError.toString(), state: ToastedStates.WARNING),


   });

 }
  }




  @override
  Future<void> close() async {
    await subscriptionnew.cancel();
    await subscriptionpast.cancel();
    return super.close();
  }
  }


