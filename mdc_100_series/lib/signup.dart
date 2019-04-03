import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}
class _SignUpPage extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Form(
              key: _formKey1,
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Username';
                  }
                },
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Form(
              key: _formKey2,
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Password';
                  }
                },
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Form(
              key: _formKey3,
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Confirm Password';
                  }
                },
                controller: _passwordConfirmController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Form(
              key: _formKey4,
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Email Address';
                  }
                },
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              child: RaisedButton(
                  child: Text('SIGN UP'),
                  onPressed: () {
                    bool __valid = _formKey1.currentState.validate();
                    __valid = _formKey2.currentState.validate() && __valid;
                    __valid = _formKey3.currentState.validate() && __valid;
                    __valid = _formKey4.currentState.validate() && __valid;
                    if(__valid) {
                      Navigator.pop(context);
                    }
                  },
                  // alignment: Alignment(0.0, 0.0),
                ),
                alignment: Alignment.centerRight,
            )
            /*
            RaisedButton(
                  child: Text('SIGN UP'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  // alignment: Alignment(0.0, 0.0),
                ),
                alignment: Alignment(0.0, 0.0),
                */
          ],
        ),
      ),
    );
  }
}