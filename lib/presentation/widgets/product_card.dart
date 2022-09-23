import 'package:ecommerce/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../shared/constants/CustomerTheme.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/user_responsive.dart';
class ProductWidget extends StatelessWidget {
  ProductModel product ;
  var deleteFunc;
  ProductWidget({Key? key , required this.product,required this.deleteFunc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: LayoutBuilder(
                builder: (context , constrains) {
                  return CachedNetworkImage(
                    imageUrl: product.image!,
                    height: constrains.maxHeight,
                    width: constrains.maxWidth,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                }
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name!,
                            style: UserTheme.get(
                                context: context,
                                fontSize: 13.sp,
                                fontWight: FontWeight.w700,
                                colorDark: white,
                                colorBright: black
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Text(
                                  "${product.price}",
                                  style: UserTheme.get(
                                      context: context,
                                      fontSize: 13.sp,
                                      fontWight:
                                      FontWeight.w700,
                                      colorDark: primaryColor,
                                      colorBright: primaryColor
                                  )
                              ),
                              Text(" JD",
                                  style: UserTheme.get(
                                      context: context,
                                      fontSize: 13.sp,
                                      fontWight:
                                      FontWeight.w700,
                                      colorDark: null,
                                      colorBright: null))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: deleteFunc,
                      child: Container(
                        margin: EdgeInsets.only(right: 3.sp),
                        height: UserResponsive.get(
                            context: context,
                            mobile: 30.sp,
                            tablet: 20.sp),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(3.sp),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: UserResponsive.get(
                              context: context,
                              mobile: 15.sp,
                              tablet: 12.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
