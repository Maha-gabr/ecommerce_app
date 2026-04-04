import 'package:ecommerce_app/domain/entities/cart/request/add_cart_request.dart';

import '../model/cart/request/add/add_cart_request_dto.dart';

extension AddCartRequestMapper on AddCartRequest{
  AddCartRequestDto toDto() {
    return AddCartRequestDto(
      productId: productId,

    );
  }
}