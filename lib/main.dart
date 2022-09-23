import 'package:ecommerce/domain/cubit/email_passweord/email_password_cubit.dart';
import 'package:ecommerce/domain/cubit/orders/order_cubit.dart';
import 'package:ecommerce/domain/cubit/product/product_cubit.dart';
import 'package:ecommerce/presentation/modules/home.dart';
import 'package:ecommerce/presentation/modules/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'domain/cubit/dropdown/dropdown_cubit.dart';
import 'domain/cubit/pregress_hud/progress_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isSigned =  sharedPreferences.getBool("signed") ?? false;
  runApp (MyApp(isSigned: isSigned));
}

class MyApp extends StatelessWidget {
  bool isSigned ;
  MyApp({Key? key , required this.isSigned}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => ProgressHudCubit()),
        BlocProvider(create: (_) => EmailPasswordCubit()),
        BlocProvider(create: (_) => DropDownCubit()..getCategory()),
        BlocProvider(create: (_) => OrderCubit()..getNewUsersOrders()..getPastUsersOrders()),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) =>
        MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Cairo',
            primarySwatch: Colors.blue,

          ),

          home: isSigned == true? const Home() :  const LogInScreen(),
        ),
      ),
    );
  }
}


