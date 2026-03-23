import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/domain/usecase/auth/login_usecase.dart';
import 'package:ecommerce_app/features/auth/cubit/auth/auth_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/app_exceptions.dart';
import '../../../../../domain/entities/auth/request/login_request.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates>{
LoginUseCase loginUseCase;
LoginViewModel(this.loginUseCase):super(AuthLoadingStates());
 Future<void> login (String pass , String email) async {
   try {
     emit(AuthLoadingStates());
     LoginRequest loginRequest= LoginRequest(
       email: email,
       password: pass,
     );
    var authResponse= await loginUseCase.call(loginRequest);
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