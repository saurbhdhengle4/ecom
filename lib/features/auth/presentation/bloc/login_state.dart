import 'package:demapp/features/auth/domain/entities/login_response.dart';

enum LoginStatus { initial, loading, sucess, failure }

class LoginState {
  final LoginStatus status;
  final LoginResponse? user;
  final String? errorMessage;

  const LoginState({
    this.status = LoginStatus.initial,
    this.user,
    this.errorMessage,
  });

  LoginState copyWith({
    LoginStatus? status,
    LoginResponse? user,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
