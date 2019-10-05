import 'package:abstraction_demo/models/user.dart';

class AuthResponse {
  final int code;
  final User body;
  final String message;

  AuthResponse({this.code, this.body, this.message});
}

abstract class AbstractAuthService {
  Future<AuthResponse> login(String email, String password);
}
