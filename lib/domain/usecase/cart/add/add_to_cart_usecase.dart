import 'package:ecommerce_app/domain/entities/cart/response/add_product_cart_response.dart';

import '../../../entities/cart/request/add_cart_request.dart';
import '../../../repo/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  CartRepo cartRepo ;
  AddToCartUseCase(this.cartRepo);

  Future<AddProductCartResponse> invoke(AddCartRequest productId) async {
    return await cartRepo.addProductToCart(productId);
  }


}