import 'package:ecommerce_app/domain/entities/cart/response/add_product_cart_response.dart';

import '../../../domain/entities/cart/response/get/get_cart_response.dart';

sealed class CartStates {}

class AddCartLoadingState extends CartStates{}
class AddCartSuccessState extends CartStates{
  AddProductCartResponse addProductCartResponse;
  AddCartSuccessState({required this.addProductCartResponse});
}
class AddCartErrorState extends CartStates{
  final String message ;
  AddCartErrorState({required this.message});
}

class GetItemCartLoadingState extends CartStates{}
class GetItemCartSuccessState extends CartStates{
  GetCartResponse getCartResponse;
  GetItemCartSuccessState({required this.getCartResponse});
}
class GetItemCartErrorState extends CartStates{
  final String message ;
  GetItemCartErrorState({required this.message});
}


class UpdateItemCartErrorState extends CartStates{
  final String message ;
  UpdateItemCartErrorState({required this.message});
}
class UpdateItemCartSuccessState extends CartStates{
  GetCartResponse getCartResponse;
  UpdateItemCartSuccessState(this.getCartResponse);
}
class DeleteItemCartSuccessState extends CartStates{
  GetCartResponse getCartResponse;
  DeleteItemCartSuccessState(this.getCartResponse);
}
class DeleteItemCartErrorState extends CartStates{
  final String message ;
  DeleteItemCartErrorState({required this.message});
}
