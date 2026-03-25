import 'package:ecommerce_app/data/data_source/remote/category/category_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';
import 'package:ecommerce_app/domain/repo/category/category_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo{
  final CategoryRemoteDataSource categoryRemoteDataSource;

  const CategoryRepoImpl({required this.categoryRemoteDataSource});

  @override
  Future<List<CategoryOrBrand>?> getAllCategory() {
    return categoryRemoteDataSource.getAllCategories();
  }
}