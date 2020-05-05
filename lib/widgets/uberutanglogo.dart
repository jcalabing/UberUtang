import 'package:flutter/material.dart';

class UberUtangLogo extends StatelessWidget {
  const UberUtangLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Image.asset("assets/images/saitama.png"),
        ),
      ),
    );
  }
}
