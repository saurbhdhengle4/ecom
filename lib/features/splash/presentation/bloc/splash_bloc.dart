import 'package:demapp/features/splash/presentation/bloc/splash_event.dart';
import 'package:demapp/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckLoginEvent>(_checkLogin);
    
  }
 
  Future<void> _checkLogin(
    CheckLoginEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());
    await Future.delayed(Duration(seconds: 3));
    bool isLoggedin = false;

    if (isLoggedin == true) {
      emit(NavigationHome());
    } else {
      emit(NavigationLogin());
    }
  }
}
