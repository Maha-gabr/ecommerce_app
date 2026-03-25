import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';
import 'package:ecommerce_app/domain/repo/category/category_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllCategoriesUseCase {
 final CategoryRepo categoryRepo;

const GetAllCategoriesUseCase({required this.categoryRepo});

Future<List<CategoryOrBrand>?>invoke(){
  return categoryRepo.getAllCategory();

}

}