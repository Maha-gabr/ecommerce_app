import 'package:ecommerce_app/api/model/auth/request/register/register_request_dto.dart';
import 'package:ecommerce_app/domain/entities/auth/request/register_request.dart';

extension RegisterRequestMapper on RegisterRequest{

 RegisterRequestDto toDomain(){
   return RegisterRequestDto(
     name: name,
     email: email,
     password: password,
     rePassword: rePassword,
     phone: phone

   );
 }

}