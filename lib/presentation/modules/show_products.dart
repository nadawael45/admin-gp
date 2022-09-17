import 'package:admingp/domain/cubit/product/product_cubit.dart';
import 'package:admingp/domain/cubit/product/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/dropdown.dart';
import '../widgets/product_card.dart';
class ProductWidgetHome extends StatelessWidget {
  ProductWidgetHome({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductStates>(
      builder: (context,state) {
        print('======================================');
        print(ProductCubit.get(context).productList.length);
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: ProductCubit.get(context).productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8),
                itemBuilder: (context,index) {
                  return ProductWidget(product : ProductCubit.get(context).productList[index],
                  deleteFunc: (){
                    ProductCubit.get(context).deleteProduct(ProductCubit.get(context).productList[index].id);
                  },
                  );
                },
              ),
            ),
          ],
        );
      }
    );
  }
}
