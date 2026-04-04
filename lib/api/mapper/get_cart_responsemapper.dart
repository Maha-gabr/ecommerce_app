import 'package:ecommerce_app/api/mapper/gat_cart_dto.dart';

import '../../domain/entities/cart/response/get/get_cart_response.dart';
import '../model/cart/response/get/get_cart_response_dto.dart';

extension GetCartResponsemapper on GetCartResponseDto{
  GetCartResponse toDomain(){
    return GetCartResponse(
      numOfCartItems :numOfCartItems,
      status: status,
      data: data?.toDomain(),
      cartId: cartId
    );
  }
}