import 'package:admingp/domain/cubit/dropdown/dropdown_cubit.dart';
import 'package:admingp/domain/cubit/orders/order_cubit.dart';
import 'package:admingp/domain/cubit/product/product_cubit.dart';
import 'package:admingp/presentation/modules/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'domain/cubit/pregress_hud/progress_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => ProgressHudCubit()),
        BlocProvider(create: (_) => DropDownCubit()..getCategory()),
        BlocProvider(create: (_) => OrderCubit()..getNewUsersOrders()..getPastUsersOrders()),


      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) =>
        MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: Home(),
        ),
      ),
    );
  }
}


