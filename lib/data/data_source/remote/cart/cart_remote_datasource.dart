import '../../../../domain/entities/cart/request/add_cart_request.dart';
import '../../../../domain/entities/cart/request/update/update_cart_count_request.dart';
import '../../../../domain/entities/cart/response/add_product_cart_response.dart';
import '../../../../domain/entities/cart/response/get/get_cart_response.dart';

abstract class CartRemoteDatasource {

  Future<AddProductCartResponse> addProductToCart(AddCartRequest productId);

  Future<GetCartResponse> getItemsInCart();


  Future<GetCartResponse> deleteItemInCart(String productId);

  Future<GetCartResponse> updateItemInInCart(String productId , int count);


}