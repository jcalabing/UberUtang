import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uberutang/utils/utang.dart';
import 'dart:async';

import 'package:uberutang/utils/utangHelper.dart';
import 'package:uberutang/widgets/MyBottomNavBar.dart';

class ListUtang extends StatefulWidget {
  ListUtang({Key key}) : super(key: key);

  @override
  _ListUtangState createState() => _ListUtangState();
}

class _ListUtangState extends State<ListUtang> {
  Future<List<Utang>> utangs;
  TextEditingController controller = TextEditingController();
  String name;
  int curUserId;

  final formKey = new GlobalKey<FormState>();
  var utangHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    utangHelper = UtangHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      utangs = utangHelper.getUtangs();
    });
  }

  clearName() {
    controller.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Utang u = Utang(id: curUserId, name: name);
        utangHelper.update(u);
        setState(() {
          isUpdating = false;
        });
      } else {
        Utang u = Utang(id: null, name: name);
        utangHelper.save(u);
      }
      clearName();
      refreshList();
    }
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (val) => val.length == 0 ? 'Enter Name' : null,
              onSaved: (val) => name = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text(isUpdating ? 'UPDATE' : 'ADD'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: Text('CANCEL'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<Utang> utangs) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NAME'),
          ),
          DataColumn(
            label: Text('DELETE'),
          ),
        ],
        rows: utangs
            .map(
              (utang) => DataRow(cells: [
                DataCell(
                  Text(utang.name),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curUserId = utang.id;
                    });
                    controller.text = utang.name;
                  },
                ),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      utangHelper.delete(utang.id);
                      refreshList();
                    },
                  ),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: utangs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }
          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text('No Data Found');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('List Utang'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {},
        child: Icon(
          Icons.note_add,
          color: Colors.amberAccent,
          size: 30.0,
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
