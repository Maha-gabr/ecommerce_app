import 'package:ecommerce_app/domain/entities/cart/request/add_cart_request.dart';
import 'package:ecommerce_app/domain/entities/cart/response/add_product_cart_response.dart';
import 'package:ecommerce_app/domain/entities/cart/response/get/get_cart_response.dart';
import 'package:ecommerce_app/domain/repo/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/cart/request/update/update_cart_count_request.dart';
import '../../../data_source/remote/cart/cart_remote_datasource.dart';
@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo{
  CartRemoteDatasource cartRemoteDatasource;
  CartRepoImpl(this.cartRemoteDatasource);
  @override
  Future<AddProductCartResponse> addProductToCart(AddCartRequest productId) {
   return cartRemoteDatasource.addProductToCart(productId);

  }

  @override
  Future<GetCartResponse> getItemsInCart() {
    return cartRemoteDatasource.getItemsInCart();

  }

  @override
  Future<GetCartResponse> deleteItemInCart(String productId) {
    return cartRemoteDatasource.deleteItemInCart(productId);
  }

  @override
  Future<GetCartResponse> updateItemInInCart(String productId, int count) {
    return cartRemoteDatasource.updateItemInInCart(productId, count);
  }

}