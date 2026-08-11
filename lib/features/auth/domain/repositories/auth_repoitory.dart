import 'package:demapp/features/auth/domain/entities/login_response.dart';

abstract class AuthRepoitory {
  Future<LoginResponse> login({
    required String username,
    required String password,
  });
}


// this is imp pont for clean architecture