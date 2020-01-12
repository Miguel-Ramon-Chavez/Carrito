import 'package:flutter/material.dart';
import 'package:flutter_kart/utils/utils.dart';

class LoginPage extends StatefulWidget {
  final Function changePage;
  LoginPage(this.changePage);
  @override
  State<StatefulWidget> createState() {
    return _LoginState(changePage);
  }
}

class _LoginState extends State<LoginPage> {
  final Function _changePage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _loginData = {
    'email' : null,
    'password' : Null
  };
  _LoginState(this._changePage);
  Color _color = Color.fromARGB(255, 255, 0, 0);

  @override
  Widget build(BuildContext context) {
    return _buildLoginWidget(_formKey, context: context);
  }

  Form _buildLoginWidget(GlobalKey formkey, {context: BuildContext}) {

    Widget _buildEmailField() {
      return TextFormField(
        validator: (String value) {
          if (!isEmail(value) || value.trim().isEmpty) return 'Ingresa Un Correo Valido.';
        },

        style: TextStyle(color: Colors.black),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        decoration: textDecoration('Email Address'),
        onSaved: (String value) {
              _loginData['email'] = value;
        },
      );
    }

    Widget _buildPasswordField() {
      return TextFormField(
        initialValue: '',
        validator: (String value) {
          if (value.trim().isEmpty) return 'Ingresa Tu Contraseña.';
        },
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        decoration: textDecoration('Password'),
        onSaved: (String value) {
              _loginData['password'] = value;
        },
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildEmailField(),
          SizedBox(
            height: 15,
          ),
          _buildPasswordField(),
          SizedBox(
            height: 15,
          ),

          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 25, right: 5),
              child: Text(
                'Olvidaste Tu Contraseña ?',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                side: BorderSide(color: Colors.black)),
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            textColor: Colors.black,
            child: Text('Login'),
            onPressed: () {
              _formKey.currentState.save();

              if (!_formKey.currentState.validate()) {
                return;
              } else {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              'Or',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          FlatButton(
            child: Text(
              'Create an account, Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              _changePage(false);
            },
          ),
        ],
      ),
    );
  }
}
class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _color = Color.fromARGB(255, 255, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
    );
  }
}