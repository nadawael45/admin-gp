import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/myOrders.dart';
import '../models/order_user_information.dart';

class OrderRepo {
  List<MyOrdersModel>? myorderList = [];

  OrderRepo({this.myorderList});

  Stream<List<OrderUserModel>> getNewUsersOrders() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection('UsersInformation')
        .orderBy('date', descending: true)
        .where('state', isEqualTo: 'onGoing')
        .snapshots()
        .map((event) {
      final List<OrderUserModel> orderUsersList = [];

      for (var element in event.docs) {
        OrderUserModel orderUserModel = OrderUserModel.fromJson(element.data());
        orderUsersList.add(orderUserModel);
      }
      return orderUsersList;
    });
  }

  Stream<List<OrderUserModel>> getPastUsersOrders() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection('UsersInformation')

        .orderBy('date', descending: true)
        .where('state', isEqualTo: 'done')
        .snapshots()
        .map((event) {
      final List<OrderUserModel> orderUsersList = [];

      for (var element in event.docs) {
        OrderUserModel orderUserModel = OrderUserModel.fromJson(element.data());
        orderUsersList.add(orderUserModel);
      }
      return orderUsersList;
    });
  }

  getAllOrderItems(userId, date) {
    print('lllllllllllllllllllll');
    print(userId);
    print(date);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection('Orders')
        .where('userId', isEqualTo: userId)
        .where('date', isEqualTo: date)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        MyOrdersModel cart = MyOrdersModel.fromJson(element.data());
        cart.id = element.id;
        myorderList!.add(cart);
      });
      print('=====================');
      print(myorderList);
      return myorderList;
    });
  }
}
