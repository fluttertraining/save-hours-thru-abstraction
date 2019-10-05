import 'package:abstraction_demo/models/user.dart';
import 'package:abstraction_demo/services/auth/api.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier implements AbstractAuthService {
  @override
  User user;

  @override
  Future<AuthResponse> login(String email, String password) async {
    // TODO
    return null;
  }
}
