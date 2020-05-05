import 'package:flutter/material.dart';
import 'package:uberutang/widgets/MyBottomNavBar.dart';
import 'package:uberutang/utils/Database.dart';

class MyOtherPage extends StatefulWidget {
  MyOtherPage({Key key}) : super(key: key);

  @override
  _MyOtherPageState createState() {
    return _MyOtherPageState();
  }
}

class _MyOtherPageState extends State<MyOtherPage> {
  Map<String, String> newUser = {};
  Future _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = getUser();
  }

  getUser() async {
    final _userData = await DBProvider.db.getUser();
    return _userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: FutureBuilder(
        future: _userFuture,
        builder: (_, userData) {
          switch (userData.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Container();
            case ConnectionState.active:
            case ConnectionState.done:
              if (!newUser.containsKey('username')) {
                newUser = Map<String, String>.from(userData.data);
              }

              return Column(children: <Widget>[
                Text(
                  newUser['username'],
                ),
                Text(
                  newUser['password'],
                )
              ]);
          }

          return Container();
        },
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
