import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';
import 'package:ecommerce_app/domain/repo/brand/brand_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllBrandsUseCase {
 final BrandRepo brandRepo;

const GetAllBrandsUseCase({required this.brandRepo});

Future<List<CategoryOrBrand>?>invoke(){
  return brandRepo.getAllBrand();

}

}