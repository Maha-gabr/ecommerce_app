import 'package:ecommerce_app/data/data_source/remote/product/product_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/product/response/product.dart';
import 'package:ecommerce_app/domain/repo/product/product_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo{
final ProductRemoteDataSource _productRemoteDataSource;
ProductRepoImpl(this._productRemoteDataSource);

  @override
  Future<List<Product>?> productRepo() {
    return _productRemoteDataSource.getAllProducts();
  }
}