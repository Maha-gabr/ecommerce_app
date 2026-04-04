import 'package:ecommerce_app/core/resources/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/app_toast.dart';
import 'package:ecommerce_app/core/widget/main_error_widget.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/cubit/cart_view_model.dart';
import '../../../products_screen/cubit/product_tap_states.dart';
import '../../../products_screen/cubit/product_tap_view_model.dart';
import '../../../products_screen/presentation/widgets/custom_product_widget.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();

}
class _ProductsTabState extends State<ProductsTab> {
  var productViewModel = getIt<ProductTapViewModel>();

  @override
  void initState() {
    super.initState();
    productViewModel.getProduct();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
//     return BlocBuilder<ProductTapViewModel, ProductTapStates>(
//       bloc: productViewModel,
//   builder: (context, state) {
//     if(state is ProductTapSuccessState){
//       var prodList = state.productList??[];
//       return Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: AppPadding.p12, vertical: AppPadding.p12),
//           child: Column(
//             children: [
//               Expanded(
//                 child: GridView.builder(
//                   itemCount: prodList.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8,
//                     // childAspectRatio: 7 / 9,
//                     childAspectRatio: 0.65,
//                   ),
//                   itemBuilder: (context, index) {
//                     return BlocListener<CartViewModel, CartStates>(
//                       bloc: getIt<CartViewModel>(),
//   builder: (context, state) {
//     return CustomProductWidget(
//         image: prodList[index].imageCover??'',
//         title: prodList[index].title??"",
//         price:prodList[index].price!.toDouble(),
//         rating: prodList[index].ratingsAverage!.toDouble(),
//         discountPercentage: 10,
//         height: height,
//         width: width,
//         description: prodList[index].description??"",
//         prodItem:prodList[index] ,
//         onAddToCart: () {
//           BlocProvider.of<CartViewModel>(context)
//               .addProductToCart("${prodList[index].id}" );
//         });
//   },
//   listener: (context, state) {
//
//                       if(state is AddCartErrorState){
//                         // return MainErrorWidget(errMessage: state.message);
//                          AppToast.appToast(text: state.message);
//                       }else if(state is AddCartSuccessState){
//                          AppToast.appToast(text: 'added Successfully');
//                       }
//
//
//   },
//                       child: BlocBuilder(builder: (context, state) {
//
//                       },),
//
// );
//                   },
//                   scrollDirection: Axis.vertical,
//                 ),
//               )
//             ],
//           ),
//         );
//     }else if(state is ProductTapErrorState){
//       return MainErrorWidget(errMessage: state.errMessage);
//     }else{
//       return MainLoadingWidget();
//     }
//
//   },
// );

    return BlocListener<CartViewModel, CartStates>(
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
      child: BlocBuilder<ProductTapViewModel, ProductTapStates>(
        bloc: productViewModel,
        builder: (context, state) {
          if (state is ProductTapSuccessState) {
            var prodList = state.productList ?? [];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p12,
              ),
              child: GridView.builder(
                itemCount: prodList.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return CustomProductWidget(
                    image: prodList[index].imageCover ?? '',
                    title: prodList[index].title ?? "",
                    price: prodList[index].price!.toDouble(),
                    rating:
                    prodList[index].ratingsAverage!.toDouble(),
                    discountPercentage: 10,
                    height: height,
                    width: width,
                    description:
                    prodList[index].description ?? "",
                    prodItem: prodList[index],
                    onAddToCart: () {
                      context.read<CartViewModel>().addProductToCart(
                        "${prodList[index].id}",
                      );
                    },
                    onClick: (){

                    },
                  );
                },
              ),
            );
          }
          else if (state is ProductTapErrorState) {
            return MainErrorWidget(
              errMessage: state.errMessage,
            );
          } else {
            return const MainLoadingWidget();
          }
        },
      ),
    );























    /////////////////////////////////////////////////////////
      // Column(
      //   children: [
      //     ProductsScreen(),
      //   ],
      // )

      // Row(
      //   children: [
      //     CategoriesList(),
      //     SizedBox(
      //       width: AppSize.s16,
      //     ),
      //     SubCategoriesList()
      //   ],
      // ),
    // );
  }
}
