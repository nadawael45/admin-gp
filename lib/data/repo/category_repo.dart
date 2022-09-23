import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';


class CategoryRepo{

  Stream<List<String>> getCategory(){

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection('categories').snapshots().map((event)  {
      final List <String> categoryList=[];


      for(var element in  event.docs){
        categoryList.add(element['name']);


      }
      return categoryList;

    });

  }


}