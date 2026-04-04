import 'package:ecommerce_app/domain/entities/cart/response/add_product_cart_response.dart';
import 'package:ecommerce_app/domain/entities/cart/response/get/get_cart_response.dart';

import '../../../entities/cart/request/add_cart_request.dart';
import '../../../repo/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemInCartUseCase {
  CartRepo cartRepo ;
  DeleteItemInCartUseCase(this.cartRepo);

  Future<GetCartResponse> invoke(String productId) async {
    return await cartRepo.deleteItemInCart(productId);
  }


}