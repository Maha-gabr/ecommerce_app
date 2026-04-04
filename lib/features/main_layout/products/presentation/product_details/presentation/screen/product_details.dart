import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/app_toast.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/routes_manager/routes.dart';
import '../../../../../../../domain/entities/product/response/product.dart';
import '../../../../../../cart/cubit/cart_view_model.dart';
import '../widgets/product_description.dart';
import '../widgets/product_item.dart';
import '../widgets/product_label.dart';
import '../widgets/product_rating.dart';
import '../widgets/product_slider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
     int count = context.watch<CartViewModel>().numOfCartItem;
    Product? prodItem = ModalRoute.of(context)?.settings.arguments as Product?;
    return BlocListener<CartViewModel, CartStates>(

  listener: (context, state) {
    if(state is AddCartSuccessState){
      AppToast.appToast(text: state.addProductCartResponse.message??'Added Successfully');
    }else if(state is AddCartErrorState){
      AppToast.appToast(text: state.message);
    }else{
      MainLoadingWidget();
    }

  },
  child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          Badge(
            backgroundColor: Colors.red,
            isLabelVisible: count >1,
            label: Text(count.toString()),
            offset: Offset(-3, -3),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.cartRoute);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorManager.primary,
                )),
          ),
        ],
      ),
      
      body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ProductSlider(items: [
                  ProductItem(
                    imageUrl:
                    prodItem?.images?[0]??''
                    // prodItem?.imageCover??''
                    //     'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
                  ),
                  ProductItem(
                    imageUrl:
                    prodItem?.images?[1]??''

                        // 'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
                  ),
                   ProductItem(
                    imageUrl:
                    prodItem?.images?[0]??''

                        // "https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg",
                  )
                ], initialIndex: 0),
                SizedBox(
                  height: 24.h,
                ),
                ProductLabel(
                      productName: prodItem?.title??"",
                    productPrice: prodItem?.price.toString()??''),

                SizedBox(
                  height: 16.h,
                ),
                 ProductRating(
                      productBuyers: prodItem?.sold.toString()??"",
                     productRating: prodItem?.ratingsAverage.toString()??"",

                 ),

                SizedBox(
                  height: 16.h,
                ),
                 ProductDescription(
                      productDescription:
                      prodItem?.description??""),
                // ProductSize(
                //   size: const [35, 38, 39, 40],
                //   onSelected: () {},
                // ),
                SizedBox(
                  height: 20.h,
                ),
                // Text('Color',
                //     style: getMediumStyle(color: ColorManager.appBarTitleColor)
                //         .copyWith(fontSize: 18.sp)),
                // ProductColor(color: const [
                //   Colors.red,
                //   Colors.blueAccent,
                //   Colors.green,
                //   Colors.yellow,
                // ], onSelected: () {}),
                // SizedBox(
                //   height: 48.h,
                // ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total price',
                          style: getMediumStyle(
                                  color: ColorManager.primary)
                              .copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(prodItem?.price.toString()??"",
                            style:
                                getMediumStyle(color: ColorManager.appBarTitleColor)
                                    .copyWith(fontSize: 18.sp))
                      ],
                    ),
                    SizedBox(
                      width: 33.w,
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        label: 'Add to cart',
                        onTap: () {
                          context.read<CartViewModel>().addProductToCart(prodItem!.id??'');
                        },
                        prefixIcon: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: ColorManager.white,
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
    ),
);
  }
}
