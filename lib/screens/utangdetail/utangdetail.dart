import 'package:flutter/material.dart';
import 'package:uberutang/utils/utang.dart';

class UtangDetail extends StatefulWidget {
  Utang utang;

  UtangDetail(this.utang);

  @override
  _UtangDetailState createState() => _UtangDetailState(utang);
}

class _UtangDetailState extends State<UtangDetail> {
  Utang utang;
  _UtangDetailState(this.utang);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Utang Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('NAME'),
              TextFormField(),
              RichText(
                text: TextSpan(
                  text: 'NAME: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: utang.name,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'AMOUNT: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: utang.amount.toString(),
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'ABOUT: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: utang.about,
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
