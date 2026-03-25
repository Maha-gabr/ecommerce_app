
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/domain/entities/auth/request/register_request.dart';
import 'package:ecommerce_app/domain/usecase/auth/regisrer_usecase.dart';
import 'package:ecommerce_app/features/auth/cubit/auth/auth_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/app_exceptions.dart';
@injectable
class RegisterViewModel extends Cubit<AuthStates>{
RegisterUseCase registerRequest;
RegisterViewModel(this.registerRequest):super(AuthLoadingStates());
 Future<void> register (String pass , String email, String name , String phone , String rePass) async {
   try {
     emit(AuthLoadingStates());
     RegisterRequest registerReq=RegisterRequest(
       name: name,
       email: email,
       password:pass ,
       rePassword: rePass,
       phone: phone
     );
    var authResponse= await registerRequest.call(registerReq);
     emit(AuthSuccessStates(authResponse: authResponse));
   }on DioException catch(e){
     final error = e.error;
     String message ='';

     if (error is AppExceptions) {
        message = error.message;
     }
  emit(AuthErrorState(appExceptions: ServerException(message: message)));

   }on AppExceptions catch(e){
     String message = e.message;
     emit(AuthErrorState(appExceptions: ServerException(message: message)));

   } catch(e){
     emit(AuthErrorState(appExceptions: ServerException(message: e.toString())));


   }

 }

}