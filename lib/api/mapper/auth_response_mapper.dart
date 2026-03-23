import 'package:ecommerce_app/api/mapper/use_response_mapper.dart';
import 'package:ecommerce_app/api/model/auth/response/auth_response_dto.dart';
import 'package:ecommerce_app/domain/entities/auth/response/auth_response.dart';

extension AuthResponseMapper on AuthResponseDto{

  AuthResponse toDto(){
    return AuthResponse(
      message: message,
      user: user?.toDto(),
      token: token
    );
  }


}