import 'package:ecommerce_app/domain/entities/auth/request/login_request.dart';
import 'package:ecommerce_app/domain/entities/auth/request/register_request.dart';
import 'package:ecommerce_app/domain/entities/auth/response/auth_response.dart';
import 'package:ecommerce_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../../data_source/remote/auth/auth_remote_data_source.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);


  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    return await _authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    return await _authRemoteDataSource.register(registerRequest);
  }

}