import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';

abstract class BrandRemoteDataSource {

  Future<List<CategoryOrBrand>?> getAllBrands ();

}