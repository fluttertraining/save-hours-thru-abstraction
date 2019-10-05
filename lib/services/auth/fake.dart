import 'package:abstraction_demo/models/user.dart';
import 'package:abstraction_demo/services/auth/api.dart';
import 'package:flutter/material.dart';

class FakeAuthService implements AbstractAuthService {
  @override
  Future<AuthResponse> login(String email, String password) async {
    User user;

    if (email == "test@test.com") {
      await Future.delayed(Duration(seconds: 2));

      user = User(email: email, role: "NORMAL");
      return AuthResponse(
        code: 200,
        message: "Everything Works!",
        body: user,
      );
    }

    if (email == "seantheurgel@gmail.com") {
      await Future.delayed(Duration(seconds: 10));

      user = User(email: email, role: "NORMAL");
      return AuthResponse(
        code: 200,
        message: "Everything Works!",
        body: user,
      );
    }

    if (email == "timeout@timeout.com") {
      await Future.delayed(Duration(seconds: 5)).timeout(
        Duration(seconds: 5),
      );

      return null;
    }

    return AuthResponse(
      code: 500,
      message: "A server error occurred",
      body: null,
    );
  }
}
