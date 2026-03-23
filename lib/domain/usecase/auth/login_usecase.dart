import 'package:ecommerce_app/domain/entities/auth/request/login_request.dart';
import 'package:ecommerce_app/domain/entities/auth/response/auth_response.dart';
import 'package:ecommerce_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
 final AuthRepo _authRepo;
  LoginUseCase(this._authRepo);


  Future<AuthResponse> call(LoginRequest loginRequest) async {
    return await _authRepo.login(loginRequest);
  }

}