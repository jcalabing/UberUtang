import 'package:flutter/material.dart';
import 'package:uberutang/screens/utangdetail/utangdetail.dart';
import 'package:uberutang/widgets/MyBottomNavBar.dart';
import 'package:uberutang/utils/utang.dart';
import 'package:uberutang/utils/utangHelper.dart';
import 'dart:async';

class UtangList extends StatefulWidget {
  @override
  _UtangListState createState() => _UtangListState();
}

class _UtangListState extends State<UtangList> {
  Future<List<Utang>> utangs;
  String name;
  int curUserId;
  int amount;

  var utangHelper;

  @override
  void initState() {
    super.initState();
    utangHelper = UtangHelper();
    refreshList();
  }

  refreshList() {
    setState(() {
      utangs = utangHelper.getUtangs();
    });
  }

  ListView dataTable(List<Utang> utangs) {
    return ListView.builder(
      itemCount: utangs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.deepPurpleAccent,
                width: 1.0,
              ),
            ),
          ),
          child: ListTile(
            leading: Text('asd'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  utangs[index].name,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  utangs[index].amount.toString(),
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UtangDetail(utangs[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }

  ulist() {
    return Expanded(
      child: FutureBuilder(
        future: utangs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }
          if (null == snapshot.data || snapshot.data.length == 0) {
            return Center(
              child: Text(
                'No Data Found',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('Utang List'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              ulist(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(
            Icons.note_add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
