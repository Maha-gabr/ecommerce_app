import 'package:ecommerce_app/data/data_source/remote/brand/brand_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';
import 'package:ecommerce_app/domain/repo/brand/brand_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandRepo)
class BrandRepoImpl implements BrandRepo{
  final BrandRemoteDataSource brandRemoteDataSource;
   const BrandRepoImpl({required this.brandRemoteDataSource});
  @override
  Future<List<CategoryOrBrand>?> getAllBrand() {
   return brandRemoteDataSource.getAllBrands();
  }


}