import 'package:ecommerce_app/domain/entities/auth/request/register_request.dart';
import 'package:ecommerce_app/domain/entities/auth/response/auth_response.dart';
import 'package:ecommerce_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);


  Future<AuthResponse> call(RegisterRequest registerRequest) async {
    return await _authRepo.register(registerRequest);
  }

}