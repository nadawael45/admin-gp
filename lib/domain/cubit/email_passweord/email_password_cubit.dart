import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'email_password_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailPasswordCubit extends Cubit<EmailPasswordStatus>{
  static FirebaseAuth auth = FirebaseAuth.instance;
  EmailPasswordCubit() : super(EmailLoading());
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  static EmailPasswordCubit get(context) => BlocProvider.of(context);
  logIn(String email , String pass) async{
    InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
    if(await internetConnectionChecker.hasConnection == false){
      emit(EmailLoginFailed(msg: "Check your internet connection and try again"));
    }
    else{
      try {
        await firebaseFireStore.collection("admin").where("userName" , isEqualTo: email).where("password" , isEqualTo: pass).get().then((value) async {
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          await sharedPreferences.setBool("signed", true);
          emit(EmailLoginSuccess());
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(EmailLoginFailed(msg: 'No user found for that email.'));
        } else if (e.code == 'wrong-password') {
          emit(EmailLoginFailed(msg: 'Wrong password provided for that user.'));
        }
      }
    }
  }
}