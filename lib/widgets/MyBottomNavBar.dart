import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      padding: EdgeInsets.only(top: 5, bottom: 30),
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            color: Colors.amber,
            icon: Icon(
              Icons.verified_user,
              size: 44.0,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          IconButton(
            color: Colors.amber,
            icon: Icon(
              Icons.home,
              size: 44.0,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/add');
            },
          ),
          IconButton(
            color: Colors.amber,
            icon: Icon(
              Icons.camera,
              size: 44.0,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/utanglist');
            },
          ),
          IconButton(
            color: Colors.amber,
            icon: Icon(
              Icons.list,
              size: 44.0,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/listutang');
            },
          ),
        ],
      ),
    );
  }
}
