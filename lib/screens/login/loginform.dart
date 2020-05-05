import 'package:flutter/material.dart';
import 'package:uberutang/models/user.dart';
import 'package:uberutang/utils/Database.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  String _email;
  String _password;

  String _validateInput(String value, String input) {
    return value.isEmpty ? '$input Required' : null;
  }

  bool _saveAndValidate() {
    if (_formStateKey.currentState.validate()) {
      _formStateKey.currentState.save();
      return true;
    }
    return false;
  }

  void _validateAndSubmit() async {
    if (_saveAndValidate()) {
      //print('Signed in: $_email $_password');
      var newDBUser = User(username: _email, password: _password);
      bool validUser = await DBProvider.db.newLogin(newDBUser);
      if (validUser) {
        Navigator.pushReplacementNamed(context, '/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formStateKey,
      autovalidate: true,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Login',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.deepPurple,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[],
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'EMAIL/USERNAME',
                labelText: 'Email/Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) => _validateInput(value, 'Email/Username'),
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'PASSWORD',
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) => _validateInput(value, 'Password'),
              onSaved: (value) => _password = value,
              obscureText: true,
            ),
            MaterialButton(
              child: Icon(
                Icons.fingerprint,
                size: 50,
              ),
              color: Colors.amber,
              textColor: Colors.white,
              onPressed: () => _validateAndSubmit(),
              splashColor: Colors.deepPurpleAccent,
              minWidth: double.infinity,
              padding: EdgeInsets.all(10),
            ),
            FlatButton(
              textColor: Colors.deepPurple,
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 140,
                  child: Divider(
                    color: Colors.deepPurple,
                  ),
                ),
                Text('  OR  '),
                Container(
                  width: 140,
                  child: Divider(
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            RaisedButton(
              color: Colors.deepPurple,
              textColor: Colors.white,
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  text: 'Create New Uber',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Utang',
                      style: TextStyle(
                        color: Colors.amberAccent,
                      ),
                    ),
                    TextSpan(text: ' Account'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
