import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/end_points.dart';
import 'package:ecommerce_app/api/model/auth/request/login/login_request_dto.dart';
import 'package:ecommerce_app/api/model/auth/request/register/register_request_dto.dart';
import 'package:ecommerce_app/api/model/auth/response/auth_response_dto.dart';
import 'package:ecommerce_app/api/model/categoty_or_brand/response/category_or_brand_response_dto.dart';
import 'package:retrofit/retrofit.dart';

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


}
