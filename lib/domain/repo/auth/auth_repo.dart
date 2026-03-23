import 'package:ecommerce_app/domain/entities/auth/request/login_request.dart';
import 'package:ecommerce_app/domain/entities/auth/request/register_request.dart';
import 'package:ecommerce_app/domain/entities/auth/response/auth_response.dart';

abstract class AuthRepo {

  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);

}