import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton(),
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'Enter Email',
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password!', hintText: 'Enter Password'),
      validator: validatePassword,
      onSaved: (value) {
        password = value!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.tealAccent,
        onPrimary: Colors.black87,
      ),
      child: Text('Submit'),
      onPressed: () {
        bool pass = _formKey.currentState!.validate();
        if (pass) {
          _formKey.currentState!.save();
          Fluttertoast.showToast(
              msg: 'trigger post $email and $password to API');
        }
      },
    );
  }
}
