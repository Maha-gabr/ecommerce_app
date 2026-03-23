import 'package:ecommerce_app/api/model/auth/request/login/login_request_dto.dart';
import 'package:ecommerce_app/domain/entities/auth/request/login_request.dart';

extension LoginRequestMapper on LoginRequest{

 LoginRequestDto toDomain(){
   return LoginRequestDto(
     email: email,
     password: password
   );
 }


}