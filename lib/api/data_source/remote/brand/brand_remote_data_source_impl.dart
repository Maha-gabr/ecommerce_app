
import 'package:ecommerce_app/api/api_services.dart';
import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/brand/brand_remote_data_source.dart';
import '../../../mapper/category_or_brand_dto.dart';
@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
 final ApiServices _apiServices;
 const BrandRemoteDataSourceImpl(this._apiServices);
  @override
  Future<List<CategoryOrBrand>?> getAllBrands() async {
    var brandResponse =await _apiServices.getAllBrand();
    // list<CategoryOrBrandDto> to list<CategoryOrBrand>
    return brandResponse.data?.map((brandDto) => brandDto.toDomain()).toList();
  }


}