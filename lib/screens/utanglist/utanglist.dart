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

  // SingleChildScrollView dataTable(List<Utang> utangs) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: DataTable(
  //       columns: [
  //         DataColumn(
  //           label: Text('NAME'),
  //         ),
  //         DataColumn(
  //           label: Text('AMOUNT'),
  //         ),
  //       ],
  //       rows: utangs
  //           .map(
  //             (utang) => DataRow(cells: [
  //               DataCell(
  //                 Text(utang.name),
  //               ),
  //               DataCell(
  //                 Text(
  //                   utang.amount.toString(),
  //                 ),
  //               ),
  //             ]),
  //           )
  //           .toList(),
  //     ),
  //   );
  // }

  // Column dataTable(List<Utang> utangs) {
  //   var test = utangs
  //       .map(
  //         (utang) => Padding(
  //           padding: const EdgeInsets.all(5.0),
  //           child: Container(
  //             padding: EdgeInsets.all(10.0),
  //             decoration: BoxDecoration(
  //               color: Colors.red,
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(5.0),
  //               ),
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 RichText(
  //                   text: TextSpan(
  //                       text: 'Name: ',
  //                       style: TextStyle(color: Colors.black54, fontSize: 30.0),
  //                       children: <TextSpan>[
  //                         TextSpan(
  //                           text: utang.name,
  //                           style: TextStyle(color: Colors.amber),
  //                         ),
  //                       ]),
  //                 ),
  //                 RichText(
  //                   text: TextSpan(
  //                       text: 'About: ',
  //                       style: TextStyle(color: Colors.amber, fontSize: 20.0),
  //                       children: <TextSpan>[
  //                         TextSpan(
  //                           text: utang.about,
  //                           style: TextStyle(color: Colors.deepPurple),
  //                         ),
  //                       ]),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       )
  //       .toList();
  //   return Column(children: test);
  // }

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
            return Text('No Data Found');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
