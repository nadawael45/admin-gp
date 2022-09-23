import 'dart:async';
import 'package:ecommerce/domain/cubit/dropdown/dropdown_states.dart';
import 'package:ecommerce/presentation/dialoges/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/category_repo.dart';

class DropDownCubit extends Cubit<DropDownStates> {
  DropDownCubit() : super(LoadingDropDown());

  static DropDownCubit get(context) => BlocProvider.of(context);

FirebaseFirestore firestor=FirebaseFirestore.instance;
FirebaseAuth auth=FirebaseAuth.instance;



  late final StreamSubscription<List<String>>subscription;

  List? categoryList ;
  var dropDownValue;
  var categoryId;

  getCategory() {
    emit((LoadingDropDown()));

    try{

      subscription=
      CategoryRepo().getCategory().listen((event) {
        categoryList=event;
        emit(GetDropCategorySuccess());
      })..onError((onError) {
        emit(GetDropCategoryFailed());
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        print(onError);
      });
    }catch(e){
      print(e);
    }

  }

  changeVal(val){
    dropDownValue=val;
    emit(ChangeVal());
    getCategoryId(val);

  }
  getCategoryId(val){
  print('iddddddd');
  print(val);
     FirebaseFirestore firestore = FirebaseFirestore.instance;
     firestore.collection('categories').where('name',isEqualTo: val).snapshots().listen((event) {
       print('ffffffffffffffffffffff');
       print(event.docs.length);
       event.docs.forEach((element) {
         categoryId=element.id;
         emit(GetCategoryId());
         print('iddddddd');
         print(element.id);
         print(element['id']);


       });
       print(categoryId);
     });

  }

  @override
  Future<void> close() async{
    await subscription.cancel();
    return super.close();
  }



}