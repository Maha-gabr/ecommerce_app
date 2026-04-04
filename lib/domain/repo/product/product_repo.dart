import 'package:ecommerce_app/domain/entities/product/response/product.dart';

abstract class ProductRepo {

  Future<List<Product>?> productRepo();
}