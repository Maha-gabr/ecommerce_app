import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/end_points.dart';
import 'package:ecommerce_app/api/model/auth/request/login/login_request_dto.dart';
import 'package:ecommerce_app/api/model/auth/request/register/register_request_dto.dart';
import 'package:ecommerce_app/api/model/auth/response/auth_response_dto.dart';
import 'package:ecommerce_app/api/model/cart/request/add/add_cart_request_dto.dart';
import 'package:ecommerce_app/api/model/cart/response/add/add_product_cart_response_dto.dart';
import 'package:ecommerce_app/api/model/cart/response/get/get_cart_response_dto.dart';
import 'package:ecommerce_app/api/model/categoty_or_brand/response/category_or_brand_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'model/cart/request/update/update_cart_count_request_dto.dart';
import 'model/product/response/product_response_dto.dart';

part 'api_services.g.dart';

@RestApi()

abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

 @POST(EndPoints.loginApi)
  Future<AuthResponseDto> login (@Body() LoginRequestDto loginRequest);

  @POST(EndPoints.registerApi)
  Future<AuthResponseDto> register (@Body() RegisterRequestDto registerRequest);

  @GET(EndPoints.categoryApi)
  Future<CategoryOrBrandResponseDto> getAllCategory ();

  @GET(EndPoints.brandApi)
  Future<CategoryOrBrandResponseDto> getAllBrand ();

  @GET(EndPoints.productApi)
  Future<ProductResponseDto> getAllProducts ();

  @POST(EndPoints.cartApi)
  Future<AddProductCartResponseDto> addProductToCart(
      @Body() AddCartRequestDto addCartRequestDto,
     @Header('token') String token
      );

  @GET(EndPoints.cartApi)
  Future<GetCartResponseDto> getItemsInCart(
      @Header('token') String token
      );

  @DELETE(EndPoints.deleteCartApi)
  Future<GetCartResponseDto> deleteItemInCart(
      @Header('token') String token,
      @Path('prodId') String prodId
      );

  @PUT(EndPoints.deleteCartApi)
  Future<GetCartResponseDto> updateItemInCart(
      @Header('token') String token,
      @Path('prodId') String prodId,
      @Body() UpdateCartCountRequestDto count
      );
}
