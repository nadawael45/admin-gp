import 'dart:async';
import 'package:admingp/domain/cubit/dropdown/dropdown_states.dart';
import 'package:admingp/presentation/dialoges/toast.dart';
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

  }

  @override
  Future<void> close() async{
    await subscription.cancel();
    return super.close();
  }



}