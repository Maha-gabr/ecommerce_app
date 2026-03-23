import 'package:ecommerce_app/api/model/auth/response/user_dto.dart';

import '../../domain/entities/auth/response/user.dart';

extension UseResponseMapper on UserDto{

 User toDto(){
   return User(
     email: email,
     name: name
   );
 }

}