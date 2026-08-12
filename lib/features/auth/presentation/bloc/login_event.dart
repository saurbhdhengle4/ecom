abstract class LoginEvent {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  final String usename;
  final String password;

  const LoginSubmitted({required this.usename, required this.password});
}
