import 'package:ecommerce_app/api/mapper/add_cart_mapper.dart';
import 'package:ecommerce_app/api/model/cart/response/add/add_product_cart_response_dto.dart';
import 'package:ecommerce_app/domain/entities/cart/response/add_product_cart_response.dart';

extension AddProductCartMapper on AddProductCartResponseDto{

  AddProductCartResponse toDomain (){
    return AddProductCartResponse(
      message: message,
      cartId: cartId,
      data: data?.toDomain(),
      numOfCartItems: numOfCartItems,
      status: status
    );
  }

}