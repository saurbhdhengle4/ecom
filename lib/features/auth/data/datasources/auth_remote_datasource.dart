import 'dart:convert';

import 'package:demapp/features/auth/data/models/login_response.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final http.Client client;

  AuthRemoteDatasourceImpl({required this.client});

  @override
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse("https://dummyjson.com/auth/login"),
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return LoginResponseModel.fromJson(data);
    }
    final Map<String, dynamic> error = jsonDecode(response.body);

    throw Exception(error['message'] ?? 'Login failed');
  }
}
