class LoginResponse {
  final int id;
  final String username;
  final String email;
  final String firstname;
  final String lastname;
  final String gender;
  final String image;
  final String accessToken;
  final String refreshToken;

  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });
}
