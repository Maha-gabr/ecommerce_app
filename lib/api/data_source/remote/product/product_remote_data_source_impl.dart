import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/api_services.dart';
import 'package:ecommerce_app/api/mapper/product_mapper.dart';
import 'package:ecommerce_app/data/data_source/remote/product/product_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/product/response/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';
@Injectable(as:ProductRemoteDataSource )
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
  final ApiServices _apiServices;
  ProductRemoteDataSourceImpl(this._apiServices);
  @override
  Future<List<Product>?> getAllProducts() async {
    try{
      var productResponse =await _apiServices.getAllProducts();
      return productResponse.data?.map((productItem) => productItem.toDomain(),).toList();
    }on DioException catch(e){
      throw ServerException(message: e.toString());
    }

  }
}