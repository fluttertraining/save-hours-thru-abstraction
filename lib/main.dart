import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:abstraction_demo/locator.dart';
import 'package:abstraction_demo/services/auth/api.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab Eat',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(71, 90, 91, 1),
        accentColor: Color.fromRGBO(247, 206, 169, 1),
        fontFamily: "GoogleSans",
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color.fromRGBO(247, 206, 169, 1),
              displayColor: Color.fromRGBO(247, 206, 169, 1),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _submitting = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _showErrorMessage(String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(message, key: Key("dialogMessage")),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Ok', key: Key("closeDialogButton")),
            isDestructiveAction: false,
            onPressed: () => Navigator.pop(context, 'Discard'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var api = GetIt.I<AbstractAuthService>();

    void _onSubmit() async {
      setState(() {
        _submitting = true;
      });

      AuthResponse response = await api.login(
        emailController.text,
        passwordController.text,
      );

      setState(() {
        _submitting = false;
      });

      if (response.code == 200) {
        _showErrorMessage(response.message);
      } else {
        _showErrorMessage(response.message);
      }
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(71, 90, 91, 1),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Abstraction Testing",
              style: Theme.of(context).textTheme.display2,
            ),
            SizedBox(height: 40),
            _CustomInputDecoration(
              placeholder: "Email",
              controller: emailController,
              key: Key("emailTextInput"),
            ),
            SizedBox(height: 20),
            _CustomInputDecoration(
              placeholder: "Password",
              obscureText: true,
              controller: passwordController,
              key: Key("passwordTextInput"),
            ),
            SizedBox(height: 20),
            _LoginButton(
              onPress: _onSubmit,
              submitting: _submitting,
              key: Key("loginButton"),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key key,
    @required this.onPress,
    @required this.submitting,
  }) : super(key: key);

  final Function onPress;
  final bool submitting;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: double.infinity,
      child: CupertinoButton(
        child: this.submitting
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 3.0,
                  key: Key("loginLoading"),
                ),
              )
            : Text(
                "Log in",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4,
                  fontSize: 14,
                ),
              ),
        borderRadius: BorderRadius.circular(20.0),
        onPressed: this.onPress,
        color: Theme.of(context).accentColor,
        // key: this.key,
      ),
    );
  }
}

class _CustomInputDecoration extends StatelessWidget {
  const _CustomInputDecoration({
    Key key,
    @required this.placeholder,
    @required this.controller,
    this.obscureText,
  }) : super(key: key);

  final String placeholder;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.placeholder),
          TextField(
            // key: this.key,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 6),
            ),
            controller: this.controller,
            obscureText: this.obscureText ?? false,
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
