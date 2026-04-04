import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/mapper/add_cart_request_mapper.dart';
import 'package:ecommerce_app/api/mapper/add_product_cart_mapper.dart';
import 'package:ecommerce_app/api/mapper/get_cart_responsemapper.dart';
import 'package:ecommerce_app/api/mapper/update_cart_request_mapper.dart';
import 'package:ecommerce_app/api/model/cart/request/update/update_cart_count_request_dto.dart';
import 'package:ecommerce_app/core/cashe/shared_prefs_utiles.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/data/data_source/remote/cart/cart_remote_datasource.dart';
import 'package:ecommerce_app/domain/entities/cart/request/add_cart_request.dart';
import 'package:ecommerce_app/domain/entities/cart/response/add_product_cart_response.dart';
import 'package:ecommerce_app/domain/entities/cart/response/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/cart/request/update/update_cart_count_request.dart';
import '../../../api_services.dart';

@Injectable(as: CartRemoteDatasource)
class CartRemoteDataSourceImpl implements CartRemoteDatasource{
  final ApiServices _apiServices;
  CartRemoteDataSourceImpl(this._apiServices);
  @override
  Future<AddProductCartResponse> addProductToCart(AddCartRequest productId)async {
    try{
      var token = SharedPrefsUtils.getData(key: 'token') as String;
      var addToCartResponse= await  _apiServices.addProductToCart(productId.toDto() , token??"");
      return addToCartResponse.toDomain();

    }on DioException catch(e){
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);

    }
  }

  @override
  Future<GetCartResponse> getItemsInCart() async {
    try{
      var token = SharedPrefsUtils.getData(key: 'token') as String;
      var getCartResponse = await _apiServices.getItemsInCart(token);
      return getCartResponse.toDomain();

    }on DioException catch(e){
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }


  }

  @override
  Future<GetCartResponse> deleteItemInCart(String productId) async {
    try{

      var token = SharedPrefsUtils.getData(key: 'token') as String;
     var deleteCartResponse = await _apiServices.deleteItemInCart(token, productId);
      return deleteCartResponse.toDomain();
    }on DioException catch(e){
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> updateItemInInCart(String productId, int count) async {
    try{
      var token = SharedPrefsUtils.getData(key: 'token') as String;
      UpdateCartCountRequestDto updateCartCountRequestDto= UpdateCartCountRequestDto(
        count: '$count'
      );
      var updateCount = await _apiServices.updateItemInCart(token, productId, updateCartCountRequestDto);
      return updateCount.toDomain();
    }on DioException catch(e){
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }

}