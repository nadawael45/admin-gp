import 'dart:async';
import 'dart:io';
import 'package:admingp/data/models/product.dart';
import 'package:admingp/domain/cubit/product/product_states.dart';
import 'package:admingp/presentation/dialoges/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/category.dart';
import '../../../data/repo/product_repo.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(LoadingProduct());

  static ProductCubit get(context) => BlocProvider.of(context);
  var image;
  var imageUrl;
    List<ProductModel>productList=[];
FirebaseFirestore firestor=FirebaseFirestore.instance;
FirebaseAuth auth=FirebaseAuth.instance;
   StreamSubscription<List<ProductModel>>? subscription;



  getProduct(dropVal) {
    print('==================================');

    emit((LoadingProduct()));
    subscription = ProductApi().getProducts(dropVal).listen((event) {
      productList = event;
      print('==================================');
      print(productList.length);
      emit(GetProductSuccess());
    })
      ..onError((e) {
        emit(GetProductFailed());
        print(e);
        print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      });
  }

  deleteProduct(id) {
    print('==================================');

     ProductApi().deleteProduct(id).then((value) => {

       showToast(msg: 'delete', state: ToastedStates.SUCCESS),
       emit(DeleteProductSuccess()),
     }).catchError((onError) {
       print(onError);
       emit(DeleteProductSuccess());
       showToast(msg: onError.toString(), state: ToastedStates.WARNING);
     });
  }



  addProduct(ProductModel productModel)async{
    emit(LoadingProduct());
    var id =  firestor.collection('products').doc().id;
    productModel.id=id;
     await  firestor.collection('products').doc(id).set(productModel.toJson()).then((value) => {
   })
       .catchError((onError) {
    print(onError);

    emit(AddProductFailed());

    showToast(msg: onError.toString(), state: ToastedStates.WARNING);
  });
    showToast(msg: 'Done2', state: ToastedStates.SUCCESS);

    emit(AddProductDone());

  }
  uploadIProductImageFireBase(var id) async {
    FirebaseStorage storage =
    FirebaseStorage.instanceFor(bucket: 'electronic-devices-877b3.appspot.com');
    Reference ref = storage.ref().child('proImg').child(id.toString());

    await ref.putFile(image!).whenComplete(()  {

        showToast(msg: 'Upload img', state: ToastedStates.SUCCESS);



    }).catchError((onError) {
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);

    });
     imageUrl =await  ref.getDownloadURL();
    emit(AddImgDone());

  }

  pickFromCamera(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
     image = File(img!.path);
    Navigator.of(context).pop();
    print(image);
    emit(ImageCamera());

  }
  pickFromGallery(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
         image = File(
        img!.path,
      );
    Navigator.of(context).pop();
    print(image);
    emit(ImageGallery());


  }


  addCategory(CategoryModel categoryModel)async{
    emit(LoadingCategory());
    var categoryid=firestor.collection('categories').doc().id;
    await uploadCategoryImageFireBase(categoryid);
    categoryModel.id=categoryid;
    categoryModel.image=imageUrl;
    await  firestor.collection('categories').doc(categoryid).set(categoryModel.toJson(categoryid)).then((value) => {
    emit(AddCategoryDone()),
        showToast(msg: 'category done', state: ToastedStates.SUCCESS),

    })
        .catchError((onError) {
      print(onError);


      emit(AddCategoryFailed());

      showToast(msg: onError.toString(), state: ToastedStates.WARNING);
    });


  }
  uploadCategoryImageFireBase(var id) async {
    FirebaseStorage storage =
    FirebaseStorage.instanceFor(bucket: 'electronic-devices-877b3.appspot.com');
    Reference ref = storage.ref().child('categoryImg').child(id);

    await ref.putFile(image!).whenComplete(()  {

      showToast(msg: 'Upload category img', state: ToastedStates.SUCCESS);



    }).catchError((onError) {
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);

    });
    imageUrl =await  ref.getDownloadURL();

  }

   end(){
    emit(End());
}

  @override
  Future<void> close() async {
    await subscription!.cancel();
    return super.close();
  }
}