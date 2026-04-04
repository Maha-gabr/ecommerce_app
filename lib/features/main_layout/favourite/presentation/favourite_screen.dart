import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widget/app_toast.dart';
import '../../../cart/cubit/cart_states.dart';
import '../../../cart/cubit/cart_view_model.dart';
import '../../products/cubit/product_tap_states.dart';
import '../../products/cubit/product_tap_view_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
  context.read<ProductTapViewModel>().getProduct();


  }
  @override
  Widget build(BuildContext context) {
    var productViewModel = context.watch<ProductTapViewModel>();
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
        child:BlocListener<CartViewModel, CartStates>(
          listener: (context, state) {
            if (state is AddCartErrorState) {
              AppToast.appToast(
                text: state.message,
                color: Colors.red,
              );
            } else if (state is AddCartSuccessState) {
              AppToast.appToast(
                text: state.addProductCartResponse.message ?? 'Added Successfully',
              );
            }
          },
          child: BlocBuilder<ProductTapViewModel, ProductTapStates>(builder:  (context, state) {
            final favProducts = productViewModel.favList ;
            if (favProducts.isEmpty) {
              return Center(child: Text('No favourites yet',style: TextStyle(fontSize: 20.sp,color: ColorManager.primary),));
            }
            return ListView.builder(
              itemCount: productViewModel.favList.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                  child:
                  FavoriteItem(
                    product: favProducts[index],
                    onTap: () {
                      productViewModel.addProductToFavourite(productViewModel.favList[index].id??'');
                    },
                    isClicked: productViewModel.isFav(productViewModel.favList[index].id??''),
                    onAddToCart: (){
                        context.read<CartViewModel>().addProductToCart(productViewModel.favList[index].id??'');
                    },
                  ),
                );

              },
            );

          },),

        ));
  }
}
