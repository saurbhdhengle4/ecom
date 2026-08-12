import 'package:demapp/features/auth/domain/usecase/login_usecase.dart';
import 'package:demapp/features/auth/presentation/bloc/login_event.dart';
import 'package:demapp/features/auth/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase}) : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }
  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final user = await loginUsecase(
        password: event.password,
        username: event.usename,
      );
      emit(state.copyWith(status: LoginStatus.sucess, user: user));
    } catch (e) {
      emit(
        state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()),
      );
    }
  }
}
