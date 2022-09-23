import 'package:ecommerce/domain/cubit/dropdown/dropdown_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/product.dart';

class ProductApi{

   ProductApi();





   Stream<List<ProductModel>> getProducts(dropVal){

     final FirebaseFirestore firestore = FirebaseFirestore.instance;
       return firestore.collection('products')
           .snapshots().map((event)  {
         final List <ProductModel> productList=[];

         for(var element in  event.docs){
           ProductModel  orderModel=ProductModel.fromJson(element.data());
           orderModel.id=element.id;
           productList.add(orderModel);

         }
         print('+++++++++++++++++++++++');
         print(productList.length);
         return productList;

       });


     }

     deleteProduct(id){
       final FirebaseFirestore firestore = FirebaseFirestore.instance;

       return firestore.collection('products').doc(id).delete();
     }

 }







