import 'package:demapp/features/auth/domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({
    required super.id,
    required super.username,
    required super.email,
    required super.firstname,
    required super.lastname,
    required super.gender,
    required super.image,
    required super.accessToken,
    required super.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstname: json["firstName"],
        lastname: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );
}
