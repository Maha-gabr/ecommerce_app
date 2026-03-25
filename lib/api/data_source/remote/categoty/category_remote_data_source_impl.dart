
import 'package:ecommerce_app/api/api_services.dart';
import 'package:ecommerce_app/data/data_source/remote/category/category_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';
import 'package:injectable/injectable.dart';

import '../../../mapper/category_or_brand_dto.dart';
@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
 final ApiServices _apiServices;
 const CategoryRemoteDataSourceImpl(this._apiServices);
  @override
  Future<List<CategoryOrBrand>?> getAllCategories() async {
    var categoryResponse =await _apiServices.getAllCategory();
    // list<CategoryOrBrandDto> to list<CategoryOrBrand>
    return categoryResponse.data?.map((catDto) => catDto.toDomain()).toList();
  }
}