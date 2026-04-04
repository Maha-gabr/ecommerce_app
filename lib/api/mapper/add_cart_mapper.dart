import 'package:ecommerce_app/api/model/cart/response/add/add_cart_dto.dart';

import '../../domain/entities/cart/response/add_cart.dart';
import 'add_product_mapper.dart';

extension AddCartMapper on AddCartDto{
  AddCart toDomain(){
    return AddCart(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      cartOwner: createdAt,
      products: products?.map((e) => e.toDomain(),).toList(),
      totalCartPrice: totalCartPrice,
      V: V,

    );

  }
}