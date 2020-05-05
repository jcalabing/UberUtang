import 'package:flutter/material.dart';
import 'package:uberutang/screens/login/loginform.dart';
import 'package:uberutang/widgets/MyBottomNavBar.dart';
import 'package:uberutang/widgets/uberutanglogo.dart';
import 'package:uberutang/widgets/uberutangbrand.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/saitamabg.png"),
              fit: BoxFit.fitWidth,
              width: double.infinity,
              color: Colors.deepPurple.shade500,
              colorBlendMode: BlendMode.darken,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(16)),
                  const UberUtangLogo(),
                  const UberUtangBrand(),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: 600,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 20.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      child: LoginForm(),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                ],
              ),
            ),
          ],
        ),
        //bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
