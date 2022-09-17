import 'package:admingp/data/models/product.dart';
import 'package:admingp/domain/cubit/dropdown/dropdown_cubit.dart';
import 'package:admingp/domain/cubit/product/product_cubit.dart';
import 'package:admingp/presentation/dialoges/toast.dart';
import 'package:admingp/presentation/widgets/custom_button.dart';
import 'package:admingp/presentation/widgets/custom_textformfield.dart';
import 'package:admingp/presentation/widgets/dropdown.dart';
import 'package:admingp/shared/constants/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/pregress_hud/progress_cubit.dart';
import '../../domain/cubit/product/product_states.dart';
import '../dialoges/pick_image.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text.dart';
class AddMenu extends StatelessWidget {

var image;

  TextEditingController controllerName=TextEditingController();
  TextEditingController controllerdesc=TextEditingController();
  TextEditingController controllerprice=TextEditingController();
  TextEditingController controllerbrand=TextEditingController();
  TextEditingController controllerdiscount=TextEditingController();

GlobalKey<FormState> keyform = GlobalKey<FormState>();

  AddMenu({super.key});

@override
  Widget build(BuildContext context) {

          return CustomScaffold(
            isBottomBack: true,
            isBottomNav: true,
            text:'Add  Product' ,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(12),
              child: CustomButton('Save', (){
                if(keyform.currentState!.validate()){
                  if(image==null){
                    showToast(msg:'You have to add Image',state: ToastedStates.ERROR);
                  }
                  if(DropDownCubit.get(context).dropDownValue==null){
                    showToast(msg:'You have to add Category',state: ToastedStates.ERROR);
                  }
                  else{
                    ProgressHudCubit.get(context).showProgress();

                    ProductCubit.get(context).uploadIProductImageFireBase(DateTime.now());
                  }

                }


              }),
            ),

            body: Padding(
              padding:  const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child:
                BlocBuilder<ProductCubit,ProductStates>(

                  builder: (BuildContext context, Object? state) {
                    if(state is ImageCamera){
                        image=  ProductCubit.get(context).image;
                    }
                   if(state is ImageGallery){
                    image=  ProductCubit.get(context).image;

                    }
                    if(state is AddProductDone){
                      ProductCubit.get(context).image=null;
                      ProductCubit.get(context).imageUrl=null;
                      image= null;
                      controllerbrand.text='';
                      controllerdiscount.text='';
                      controllerName.text='';
                      controllerprice.text='';
                      controllerdesc.text='';
                      DropDownCubit.get(context).dropDownValue='';
                      ProgressHudCubit.get(context).dismissProgress();
                      ProductCubit.get(context).end();




                    }
                    if(state is AddImgDone){
                      print('droooooooooooooooooooooop');
                      print(DropDownCubit.get(context).dropDownValue);
                      ProductCubit.get(context).addProduct(
                          ProductModel(
                            rating: 3.5,
                            categoryName: DropDownCubit.get(context).dropDownValue,
                              name: controllerName.text,
                            price:int.parse(controllerprice.text),
                            description: controllerdesc.text,
                            brand: controllerbrand.text,
                            discount: int.parse(controllerdiscount.text),
                            image: ProductCubit.get(context).imageUrl,
                          ),


                      );
                    }
                   return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.grey[350],
                          height: 23.h,
                          width: 100.w,
                         child: image==null?Icon(Icons.photo,size: 50.sp,color: Colors.white,):Image.file(image,fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child:     InkWell(
                              onTap: (){
                                showDialog(context: context, builder: (builder)=> PickImageDialoge());

                              },

                              child: CustomText(text: 'Upload Image',textDecoration: TextDecoration.underline,)),
                        ),
                        Form(
                            key: keyform,
                            child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    controller:controllerName ,
                                    validate:Validator.validateEmpty,

                                    hintText: 'product name'),
                              ),
                              SizedBox(width: 30.sp,),
                              Expanded(
                                child: CustomTextFormField(
                                    controller:controllerbrand ,
                                    validate:Validator.validateEmpty,

                                    hintText: 'brand'),
                              ),

                            ],
                          ),
                          SizedBox(height: 20.sp,),

                          CustomTextFormField(
                           // controller:controllerCategory ,
                            readonly: true,

                            hintText: 'Add product category',
                            suffixIcon: DropDown('Select Category'),

                          ),
                          SizedBox(height: 20.sp,),
                          CustomTextFormField(
                              validate:Validator.validateEmpty,

                              controller:controllerdesc ,
                               hintText: 'Add description'),
                          SizedBox(height: 20.sp,),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    controller:controllerprice ,
                                    validate:Validator.validateEmpty,

                                    hintText: 'price'),
                              ),
                              SizedBox(width: 30.sp,),
                              Expanded(
                                child: CustomTextFormField(
                                  controller:controllerdiscount ,
                                  hintText: 'discount',
                                  validate:Validator.validateEmpty,

                                  keyBoardType: TextInputType.number,
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 20.sp,),

                        ],)),


                      ],
                    );
                  }

                ),
              ),
            ),
          );

  }
}
