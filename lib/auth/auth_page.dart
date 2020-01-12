import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthpageState();
  }
}

class _AuthpageState extends State<AuthPage> {
  bool _isLogin = true;
  void changePage(bool isLogin) {
    setState(() {
      _isLogin = isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Carrito',
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                ),
                _isLogin ? LoginPage(changePage) : SignUpPage(changePage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
