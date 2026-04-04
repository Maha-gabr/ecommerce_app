import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/di.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/app_toast.dart';
import 'package:ecommerce_app/core/widget/main_error_widget.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_states.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/cashe/shared_prefs_utiles.dart';
import '../../../core/routes_manager/routes.dart';
import '../../../domain/entities/cart/request/update/update_cart_count_request.dart';
import '../cubit/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartViewModel cartViewModel;
  @override
  void initState() {
    // cartViewModel = context.read<CartViewModel>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartViewModel.getItemsInCart();
    },);
      // context.read<CartViewModel>().getItemsInCart();

  }
  @override
  Widget build(BuildContext context) {
    int count = context.watch<CartViewModel>().numOfCartItem;
    cartViewModel= BlocProvider.of(context);
    // int? count = SharedPrefsUtils.getData(key: 'numOfCartItem') as int?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [

          Badge(
            label: Text('$count'),        // the number shown
            isLabelVisible: (count) > 0,    // hide when 0
            backgroundColor: Colors.red,
            textColor: Colors.white,
            offset: Offset(-5, -1),
            child: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.cartRoute),
                icon: ImageIcon(
                  AssetImage(IconsAssets.icCart),
                  color: ColorManager.primary,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: BlocConsumer<CartViewModel, CartStates>(
          // bloc: getIt<CartViewModel>()..getItemsInCart(),
          // bloc: cartViewModel..getItemsInCart(),
          listener: (context, state) {
            if(state is DeleteItemCartSuccessState){
              AppToast.appToast(text: "Deleted Successfully");
            }else if (state is DeleteItemCartErrorState) {
              AppToast.appToast(text: "un deleted");
            }
          },
          buildWhen: (previous, current) =>
          current is GetItemCartSuccessState ||
              current is GetItemCartErrorState ||
              current is GetItemCartLoadingState,
  builder: (context, state) {
    if(state is GetItemCartErrorState){
      return MainErrorWidget(
        errMessage: state.message,
        onTap: () async {
        await cartViewModel.getItemsInCart();
      },);
    }else if(state is GetItemCartSuccessState){
      // var cartList = state.getCartResponse.data?.products??[]; old list ,before delet product
      var cartList =cartViewModel.cartList;
      return
        Column(
        children: [
        // Text(cartViewModel.cartList.length.toString()),
          Expanded(
            // the list of cart items ===============
            child:
            ListView.separated(
              itemBuilder: (context, index) => CartItemWidget(
                imagePath: cartList[index].product?.imageCover??"",
                title:  cartList[index].product?.title??"",
                price:  cartList[index].price??0,
                quantity:  cartList[index].count??0,
                onDeleteTap: () async {
                  // var token = SharedPrefsUtils.getData(key: 'token') as String;
                  // print(token??"✔✔✔✔");
                await cartViewModel.deleteItemsInCart(cartList[index].product?.id??'');

                },
                onDecrementTap: (_) async {

                  final id = cartList[index].product?.id ?? "";
                  final count = cartList[index].count != 1 ? (cartList[index].count ?? 1) - 1 : 1;
                  await cartViewModel.updateItemsInCart(id, count);

                },
                onIncrementTap: (_) async {

                  final id = cartList[index].product?.id ?? "";
                  final count = (cartList[index].count ?? 1) + 1;
                  await cartViewModel.updateItemsInCart(id, count);
                },
                // size: 40,
                // color: Colors.black,
                // colorName: 'Black',
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppSize.s12.h),
              // itemCount: state.getCartResponse.data?.products?.length??0,
              itemCount: cartViewModel.cartList.length,


            ),
          ),
          // the total price and checkout button========
          TotalPriceAndCheckoutBotton(
            // totalPrice:  state.getCartResponse.data?.totalCartPrice??0,
            totalPrice: cartViewModel.data?.totalCartPrice??0,
            checkoutButtonOnTap: () {},
          ),
          SizedBox(height: 10.h),
        ],
      );

    }else{
      return MainLoadingWidget();
    }
  },
),
      ),
    );
  }
}
