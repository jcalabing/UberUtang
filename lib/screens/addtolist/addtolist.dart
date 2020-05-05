import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uberutang/utils/utang.dart';
import 'package:uberutang/utils/utangHelper.dart';
import 'package:uberutang/widgets/MyBottomNavBar.dart';

class AddToList extends StatefulWidget {
  @override
  _AddToListState createState() => _AddToListState();
}

class _AddToListState extends State<AddToList> {
  String name;
  int amount;
  String about;
  var utangHelper;

  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    utangHelper = UtangHelper();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add new'),
        ),
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: addForm(),
        ),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }

  addUtang() {
    formKey.currentState.save();
    Utang u = Utang(
      id: null,
      name: name,
      amount: amount,
      about: about,
    );
    //print(amount);
    utangHelper.save(u);
  }

  addForm() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (val) => val.length == 0 ? 'Enter Name' : null,
            onSaved: (val) => name = val,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Amount'),
            onSaved: (val) => amount = int.tryParse(val),
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(labelText: 'About'),
            onSaved: (val) => about = val,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                MaterialButton(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  color: Colors.amber,
                  textColor: Colors.deepPurple,
                  onPressed: addUtang,
                  child: RichText(
                    text: TextSpan(
                      text: 'SAVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                MaterialButton(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  textColor: Colors.deepPurple,
                  color: Colors.grey,
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'CANCEL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
