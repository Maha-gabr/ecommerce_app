import 'package:ecommerce_app/domain/repo/product/product_repo.dart';
import 'package:injectable/injectable.dart';

import '../../entities/product/response/product.dart';
@injectable
class GetAllProductUseCase {
  final ProductRepo _productRepo;
  GetAllProductUseCase(this._productRepo);

  Future<List<Product>?> invoke() async {
    return await _productRepo.productRepo();
  }

}