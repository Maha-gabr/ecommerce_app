import 'package:ecommerce_app/api/mapper/get_products_mapper.dart';
import 'package:ecommerce_app/domain/entities/cart/response/get/get_cart.dart';

import '../model/cart/response/get/get_cart_dto.dart';

extension getCartDto on GetCartDto{
  GetCart toDomain(){
    return GetCart(
      V: V,
      totalCartPrice: totalCartPrice,
      products:products?.map((e) => e.toDomain(),).toList(),
      cartOwner: cartOwner,
      updatedAt: updatedAt,
      createdAt: createdAt,
      id: id,

    );
  }
}