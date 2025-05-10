import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: "https://t-store-server.onrender.com/api/auth"));

  Future<String?> registerUser(String name, String email, String phone,
      String password) async {
    try {
      var response = await _dio.post("/register", data: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "termsAccepted": true
      });

      return response.data["token"];
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> loginUser(String email, String password) async {
    try {
      var response = await _dio.post(
        "/login",
        data: {
          "email": email.trim(),
          "password": password.trim(),
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        return response.data["token"];
      } else {
        print("Login failed: ${response.data}");
        return null;
      }
    } catch (e) {
      if (e is DioException) {
        print("DioException: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("Unexpected Error: $e");
      }
      return null;
    }
  }
}