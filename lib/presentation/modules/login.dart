import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/email_passweord/email_password_cubit.dart';
import '../../domain/cubit/email_passweord/email_password_state.dart';
import '../widgets/app_toast.dart';
import '../widgets/custom button.dart';
import '../widgets/customer text fileld.dart';
import '../widgets/customer text.dart';
import 'home.dart';
import 'logo.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late String email , passwoed ;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10.sp),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150.sp,),
                  const LOGO(),
                  SizedBox(height: 30.sp,),
                  const CustomText(
                    text: "UserName",
                  ),
                  CustomerTextField(
                    hint: "Enter your username",
                    secure: false,
                    validator: (String? value){
                      if(value?.isEmpty == true){
                        return "required";
                      }
                    },
                    onSaved: (String? value){
                      setState(() {
                        email = value.toString() ;
                      });
                    },
                  ),
                  SizedBox(height: 10.sp,),
                  const CustomText(
                    text: "Password",
                  ),
                  CustomerTextField(
                    hint: "Enter your Password",
                    secure: true,
                    validator: (String? value){
                      if(value?.isEmpty == true){
                        return "required";
                      }
                    },
                    onSaved: (String? value){
                      setState(() {
                        passwoed = value.toString() ;
                      });
                    },
                  ),
                  SizedBox(height: 20.sp,),

                  BlocListener<EmailPasswordCubit , EmailPasswordStatus>(
                    listener: (context , state){
                      if(state is EmailLoginSuccess){
                        showToastError(msg: state.msg.toString(), state: ToastedStates.SUCCESS);
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const Home()));
                      }
                      else if(state is EmailLoginFailed){
                        showToastError(msg: state.msg.toString(), state: ToastedStates.ERROR);
                      }
                    },
                    child: UserButton(
                      title: "LogIn",
                      onClick: () async{
                        if(formKey.currentState?.validate() == true){
                          formKey.currentState!.save();
                          await EmailPasswordCubit.get(context).logIn(email , passwoed);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
