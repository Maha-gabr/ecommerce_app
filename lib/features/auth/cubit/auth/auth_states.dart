import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/domain/entities/auth/response/auth_response.dart';

sealed class AuthStates {}

class AuthLoadingStates extends AuthStates{}

class AuthSuccessStates extends AuthStates{
  AuthResponse authResponse;
  AuthSuccessStates({required this.authResponse});

}

class AuthErrorState extends AuthStates{
  AppExceptions appExceptions;
  AuthErrorState({required this.appExceptions});
}