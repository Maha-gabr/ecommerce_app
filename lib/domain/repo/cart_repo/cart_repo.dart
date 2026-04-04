import 'package:ecommerce_app/api/model/cart/response/get/get_cart_response_dto.dart';
import 'package:ecommerce_app/domain/entities/cart/response/add_product_cart_response.dart';

import '../../entities/cart/request/add_cart_request.dart';
import '../../entities/cart/request/update/update_cart_count_request.dart';
import '../../entities/cart/response/get/get_cart_response.dart';

abstract class CartRepo {
  Future<AddProductCartResponse> addProductToCart(AddCartRequest productId);

  Future<GetCartResponse> getItemsInCart();

  Future<GetCartResponse> deleteItemInCart(String productId);

  Future<GetCartResponse> updateItemInInCart(String productId , int count);


}


