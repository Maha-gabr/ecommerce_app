import 'package:ecommerce_app/domain/entities/product/response/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>?> getAllProducts ();

}