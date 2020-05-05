import 'package:flutter/material.dart';

class UberUtangBrand extends StatelessWidget {
  const UberUtangBrand({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Uber',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            // decoration: TextDecoration.underline,
            // decorationThickness: 3,
            // decorationColor: Colors.amber,
            // decorationStyle: TextDecorationStyle.wavy,
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
          ],
        ),
      ),
    );
  }
}
