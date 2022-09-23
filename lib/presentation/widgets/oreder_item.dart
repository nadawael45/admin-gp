import 'package:ecommerce/domain/cubit/orders/order_cubit.dart';
import 'package:ecommerce/presentation/modules/orde_details.dart';
import 'package:ecommerce/presentation/widgets/custom_badge.dart';
import 'package:ecommerce/presentation/widgets/custom_button.dart';
import 'package:ecommerce/presentation/widgets/custom_text.dart';
import 'package:ecommerce/shared/constants/colors.dart';
import 'package:ecommerce/shared/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderItem extends StatelessWidget {
  String? name,date,comment,userId,phone,delivery;
  var userListIndex;
  var userList;
  var doneFunc;
  var deleteFunc;
  int? total=0;

  bool isdone;

   OrderItem({Key? key,this.total,this.name,this.date,this.doneFunc,this.phone,this.deleteFunc,this.userList,
     this.comment,this.userId,this.userListIndex,this.isdone=true,this.delivery=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: LayoutBuilder(
          builder: (context,constrains) {
            return Card(
              color: Colors.blue.shade100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        UserRow(name: name, date: date, total: total,),
                        SizedBox(height: 5,),



                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: constrains.maxWidth*0.975,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 12,right: 12,left: 12),
                          child: CustomText(text: comment,),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                        child: Row(children: [
                          Expanded(child: CustomButton('Call Customer', ()=>
                              makePhoneCall(phone),textColor: primaryColor,btnColor: Colors.white,txtSize: 10,height: 35,)),
                          SizedBox(width: 6,),
                          Expanded(child: CustomButton('View Details'
                              , ()async{
                                OrderCubit.get(context).myOrderCubit=[];
                                await OrderCubit.get(context).getOrders(userId, date);
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 OrderDetails(userListIndex,userList)));
                              },
                              textColor: primaryColor,
                              btnColor: Colors.white,
                              txtSize: 10,height: 35)),
                          SizedBox(width: 60,),
                          Expanded(child: CustomButton('Delete Order', deleteFunc,borderColor: Colors.red,btnColor: Colors.red,txtSize: 10,height: 35)),
                          SizedBox(width: 6,),
                          isdone!?
                          Expanded(child: CustomButton('Done Order', doneFunc,borderColor: Colors.green,btnColor: Colors.green,txtSize: 10,height: 35)):
                              const SizedBox()

                        ],),
                      )
                    ],),

                  ),


                ],
              ),
            );
          }
        ),
      );
  }
}

class UserRow extends StatelessWidget {
   UserRow({
    Key? key,
    required this.name,
    required this.date,
    required this.total,
      this.list,
    this.visible=false,
     this.badge=false


  }) : super(key: key);

  final String? name;
  final String? date;
  final int? total;
  bool visible;
  bool badge;
  List? list=[];



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(foregroundColor: primaryColor,radius: 25,backgroundImage: AssetImage(ImageManager.avatar),),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(text: name,fontWeight: FontWeight.bold,),
                SizedBox(width: 5,),
                badge==true?Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Custom_badge(list: list),
                ):const SizedBox(),
              ],
            ),
            SizedBox(height: 6,),
            CustomText(text: date!.split('.')[0],textAlign: TextAlign.start,txtSize: 12,),

          ],
        ),
        Spacer(),
       Column(
         children: [


           CustomText(text:'Total : $total JD' ,fontWeight: FontWeight.bold,),
           SizedBox(height: 5,),

         ],
       ),
      ],
    );
  }
}
Future<void> makePhoneCall(phone) async {
  Uri launchUri = Uri(
    scheme: 'tel',
    path: phone,
  );
  await launch(launchUri.toString());
}
