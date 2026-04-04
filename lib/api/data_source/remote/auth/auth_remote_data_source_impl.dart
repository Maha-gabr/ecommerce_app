
import 'package:ecommerce_app/api/api_services.dart';
import 'package:ecommerce_app/api/mapper/login_request_mapper.dart';
import 'package:ecommerce_app/api/mapper/register_request_mapper.dart';
import 'package:ecommerce_app/core/cashe/shared_prefs_utiles.dart';
import 'package:ecommerce_app/data/data_source/remote/auth/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/auth/request/login_request.dart';
import 'package:ecommerce_app/domain/entities/auth/request/register_request.dart';
import 'package:ecommerce_app/domain/entities/auth/response/auth_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../mapper/auth_response_mapper.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final ApiServices _apiServices;
   AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    //mapping
  //authResponseDto => authResponse
  //loginRequest =>LoginRequestDto
    var authResponse =await _apiServices.login(loginRequest.toDomain());
    await SharedPrefsUtils.saveData(key: 'token', value: authResponse.token??"");
    return authResponse.toDto();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    var authResponse = await _apiServices.register(registerRequest.toDomain());
    await SharedPrefsUtils.saveData(key: 'token', value: authResponse.token??"");
    return authResponse.toDto();

  }



}