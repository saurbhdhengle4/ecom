import 'package:demapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:demapp/features/auth/domain/entities/login_response.dart';
import 'package:demapp/features/auth/domain/repositories/auth_repoitory.dart';

class AuthRespositoryImpl implements AuthRepoitory {
  final AuthRemoteDatasource remoteDatasource;

  AuthRespositoryImpl({required this.remoteDatasource});
  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    return await remoteDatasource.login(username: username, password: password);
  }
}
