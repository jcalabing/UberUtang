import 'package:flutter/material.dart';
import 'package:uberutang/screens/utanglist/utanglist.dart';
import 'screens/addtolist/addtolist.dart';
import 'screens/MyHomePage.dart';
import 'screens/MyOtherPage.dart';
// import 'package:uberutang/screens/listallutang.dart';
import 'screens/login/login.dart';
import 'screens/listutang/listutang.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/add',
      routes: {
        '/utanglist': (context) => UtangList(),
        '/listutang': (context) => ListUtang(),
        '/login': (context) => Login(),
        '/': (context) => MyHomePage(),
        '/other': (context) => MyOtherPage(),
        '/add': (context) => AddToList(),
      },
      // home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saving data'),
//       ),
//       body: Row(
//         //mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: RaisedButton(
//               child: Text('Read'),
//               onPressed: () {
//                 _read();
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: RaisedButton(
//               child: Text('Save'),
//               onPressed: () {
//                 _save();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Replace these two methods in the examples that follow

//   _read() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     final value = prefs.getInt(key) ?? 0;
//     print('read: $value');
//   }

//   _save() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     final value = 42;
//     prefs.setInt(key, value);
//     print('saved $value');
//   }
// }
