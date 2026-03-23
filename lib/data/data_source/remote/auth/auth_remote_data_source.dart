import '../../../../domain/entities/auth/request/login_request.dart';
import '../../../../domain/entities/auth/request/register_request.dart';
import '../../../../domain/entities/auth/response/auth_response.dart';

abstract class AuthRemoteDataSource {

 Future<AuthResponse>  login (LoginRequest loginRequest);

 Future<AuthResponse>  register (RegisterRequest registerRequest);


}