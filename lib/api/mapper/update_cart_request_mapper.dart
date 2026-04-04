import 'package:ecommerce_app/api/model/cart/request/update/update_cart_count_request_dto.dart';

import '../../domain/entities/cart/request/update/update_cart_count_request.dart';

extension UpdateCartRequestMapper on UpdateCartCountRequest{
  UpdateCartCountRequestDto toDto(){
    return UpdateCartCountRequestDto(
      count: count,
    );

  }
}