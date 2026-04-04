
import 'package:ecommerce_app/domain/entities/cart/response/get/get_cart_response.dart';
import 'package:ecommerce_app/domain/repo/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemsInCartUseCase {
  CartRepo cartRepo;
  GetItemsInCartUseCase(this.cartRepo);

  Future<GetCartResponse> invoke(){
    return cartRepo.getItemsInCart();
  }
}