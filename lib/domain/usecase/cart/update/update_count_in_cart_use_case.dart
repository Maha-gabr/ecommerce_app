import 'package:ecommerce_app/domain/entities/cart/response/get/get_cart_response.dart';

import '../../../entities/cart/request/update/update_cart_count_request.dart';
import '../../../repo/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepo cartRepo ;
  UpdateCountInCartUseCase(this.cartRepo);

  Future<GetCartResponse> invoke(String productId, int count) async {
    return await cartRepo.updateItemInInCart(productId,count);
  }


}