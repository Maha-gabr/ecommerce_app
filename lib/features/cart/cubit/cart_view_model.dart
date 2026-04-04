import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/cashe/shared_prefs_utiles.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/domain/entities/cart/request/add_cart_request.dart';
import 'package:ecommerce_app/domain/entities/cart/response/get/get_product.dart';
import 'package:ecommerce_app/domain/usecase/cart/add/add_to_cart_usecase.dart';
import 'package:ecommerce_app/domain/usecase/cart/delete/delete_item_in_cart_use_case.dart';
import 'package:ecommerce_app/domain/usecase/cart/get/get_items_in_cart_use_case.dart';
import 'package:ecommerce_app/domain/usecase/cart/update/update_count_in_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_states.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/cart/response/get/get_cart.dart';
@injectable
class CartViewModel extends Cubit<CartStates>{
  AddToCartUseCase addToCartUseCase;
  GetItemsInCartUseCase getItemsInCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;
  CartViewModel(this.addToCartUseCase, this.getItemsInCartUseCase, this.updateCountInCartUseCase, this.deleteItemInCartUseCase):super(AddCartLoadingState());

  int numOfCartItem =0;
  late List<GetProducts> cartList;
  late GetCart? data;

  Future<void> addProductToCart(String productId) async {
    try{
      emit( AddCartLoadingState());
      AddCartRequest addCartRequest = AddCartRequest(productId: productId);
      var addCartResponse=await addToCartUseCase.invoke(addCartRequest);
      numOfCartItem= addCartResponse.numOfCartItems??0;
       emit(AddCartSuccessState(addProductCartResponse: addCartResponse));
    }on AppExceptions catch(e){

      emit(AddCartErrorState(message: e.message));
    }
  }
  // get items in cart
  Future<void> getItemsInCart() async {
    try{
      emit(GetItemCartLoadingState());
      var getItemsInCart=await getItemsInCartUseCase.invoke();
      numOfCartItem= getItemsInCart.numOfCartItems??0;
      cartList = getItemsInCart.data?.products??[];
      data = getItemsInCart.data;
      SharedPrefsUtils.saveData(key: 'numOfCartItem', value: numOfCartItem);
      emit(GetItemCartSuccessState(getCartResponse: getItemsInCart));
    }on AppExceptions catch(e){
      emit(GetItemCartErrorState(message: e.message));
    }
  }

  Future<void> deleteItemsInCart(String prodId) async {
    try{
      var deleteItemsInCart=await deleteItemInCartUseCase.invoke(prodId);
      numOfCartItem= deleteItemsInCart.numOfCartItems??0;
       cartList =deleteItemsInCart.data?.products??[];
      data = deleteItemsInCart.data;

      // await getItemsInCart();
      print('🚩🚩🚩deleted');



      emit(DeleteItemCartSuccessState(deleteItemsInCart));
    }on AppExceptions catch(e){
      emit(DeleteItemCartErrorState(message: e.message));
    }
  }


  Future<void> updateItemsInCart(String prodId, int count) async {
    try{
      var updateItemsInCart=await updateCountInCartUseCase.invoke(prodId, count);
      cartList = updateItemsInCart.data?.products??[];
      data =updateItemsInCart.data;
      // await getItemsInCart();
      emit(UpdateItemCartSuccessState(updateItemsInCart));
    }on AppExceptions catch(e){
      emit(UpdateItemCartErrorState(message: e.message));
    }
  }
}