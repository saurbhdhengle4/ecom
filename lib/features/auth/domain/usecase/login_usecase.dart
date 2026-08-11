import 'package:demapp/features/auth/domain/entities/login_response.dart';
import 'package:demapp/features/auth/domain/repositories/auth_repoitory.dart';

class LoginUsecase {
  final AuthRepoitory repoitory;
  LoginUsecase({required this.repoitory});

  Future<LoginResponse> call({
    required String username,
    required String password,
  }) async {
    return await repoitory.login(username: username, password: password);
  }
}
