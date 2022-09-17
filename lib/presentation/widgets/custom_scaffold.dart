
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/pregress_hud/progress_cubit.dart';
import '../../domain/cubit/pregress_hud/progress_states.dart';
import '../../shared/constants/colors.dart';
import '../dialoges/progress_hud.dart';
import 'custom_text.dart';

class CustomScaffold extends StatelessWidget {

  var body;
  bool boolAppBar;
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? text;
  var prefixFunction;
  var suffixFunction;
  var scaffKey;
  bool? isBottomNav;
  bool? isBottomBack;
  var bottomNavigationBar;

  CustomScaffold({
    this.boolAppBar=true,
    this.prefixIcon, this.suffixIcon, this.text, this.prefixFunction,
    this.suffixFunction,
    this.body,this.bottomNavigationBar,
    this.isBottomBack=false,this.isBottomNav=false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:BlocBuilder<ProgressHudCubit,ProgressHudStates>(
          builder: (BuildContext context, Object? state) {
            return ModalProgressHUD(
              progressIndicator: const HudWidget(),
              inAsyncCall: ProgressHudCubit.get(context).loading,
            child: Scaffold(
              backgroundColor: backgroungd,
              appBar: boolAppBar==false?PreferredSize(child: SizedBox(), preferredSize: Size(0,0)):
                      AppBar(
                        centerTitle: true,
                        backgroundColor: primaryColor,

                        title: CustomText(text: text,color: Colors.white,fontWeight: FontWeight.bold,),
                        leading: isBottomBack==true?const BackButton(color: Colors.white,):const SizedBox(),

                      ),
              body: body,
              bottomNavigationBar: isBottomNav==true?bottomNavigationBar:const SizedBox(),


            ),
          );
        }
      ),
    );
  }
}
