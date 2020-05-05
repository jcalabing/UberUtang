import 'package:flutter/material.dart';
import 'package:uberutang/widgets/MyBottomNavBar.dart';
import 'package:uberutang/models/user.dart';
import 'package:uberutang/utils/Database.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var username;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(children: <Widget>[
                  Text('Username'),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(children: <Widget>[
                  Text('Password'),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: FlatButton(
                  child: Text('Save'),
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    var newDBUser =
                        User(username: username, password: password);
                    DBProvider.db.newUser(newDBUser);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
