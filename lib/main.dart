import 'package:flutter/material.dart';
import 'package:uberutang/screens/utanglist/utanglist.dart';
import 'screens/addtolist/addtolist.dart';
import 'screens/login/login.dart';
import 'screens/listutang/listutang.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => UtangList(),
        '/listutang': (context) => ListUtang(),
        '/login': (context) => Login(),
        '/add': (context) => AddToList(),
      },
    );
  }
}
