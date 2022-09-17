import 'package:admingp/data/models/category.dart';
import 'package:admingp/domain/cubit/pregress_hud/progress_cubit.dart';
import 'package:admingp/presentation/widgets/custom_button.dart';
import 'package:admingp/presentation/widgets/custom_text.dart';
import 'package:admingp/presentation/widgets/custom_textformfield.dart';
import 'package:admingp/shared/constants/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/product/product_cubit.dart';
import '../../domain/cubit/product/product_states.dart';
import '../dialoges/pick_image.dart';
import '../dialoges/toast.dart';
import '../widgets/custom_scaffold.dart';
class AddCategory extends StatelessWidget {
  var image;
  TextEditingController controller=TextEditingController();
  GlobalKey<FormState> keyform = GlobalKey<FormState>();

  AddCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return CustomScaffold(
          isBottomBack: true,
          text: 'Add  Category',

          body: Padding(
            padding: const EdgeInsets.all(15),
            child:   BlocBuilder<ProductCubit,ProductStates>(

                builder: (BuildContext context, Object? state) {
                  if(state is ImageCamera){
                    image=  ProductCubit.get(context).image;
                  }
                  if(state is ImageGallery){
                    image=  ProductCubit.get(context).image;

                  }
                  if(state is AddCategoryDone){
                    ProductCubit.get(context).image=null;
                    ProductCubit.get(context).imageUrl=null;
                    image=null;
                    controller.text='';
                    ProgressHudCubit.get(context).dismissProgress();
                    ProductCubit.get(context).end();

                  }

                return Column(children: [
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
                  const SizedBox(height: 10,),
                  Form(key: keyform,
                      child: CustomTextFormField(hintText: 'Enter Category Name',controller:controller ,validate: Validator.validateEmpty,)),
                  const Spacer(),
                  CustomButton('Save', (){
                   if(keyform.currentState!.validate()){
                       if(image==null){
                         showToast(msg:'You have to add Image',state: ToastedStates.ERROR);

                       }else{
                         ProgressHudCubit.get(context).showProgress();
                         ProductCubit.get(context).addCategory(CategoryModel(
                           name: controller.text
                         ));
                       }


                   }
                  })
                ],);
              }
            ),
          ),
        );

  }
}

