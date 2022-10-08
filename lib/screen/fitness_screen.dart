import 'package:fitness_record/screen/fitness_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/fitness_model.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({Key? key}) : super(key: key);

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _fitnessSearchText = "";

  _FitnessScreenState() {
    _filter.addListener(() {
      setState(() {
        _fitnessSearchText = _filter.text;
      });
    });
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('fitness').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return LinearProgressIndicator();
          else {
            return _buildList(context, snapshot.data!.docs);
          }
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> searchResults = [];
    for (DocumentSnapshot d in snapshot) {
      if (d.data().toString().contains(_fitnessSearchText)) {
        searchResults.add(d);
      }
    }
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
        border: TableBorder.all(style: BorderStyle.none),
        children: [
          TableRow(children: [
            Text("운동이름",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text("부위",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text("RM",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text("기록횟수",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ]),
          ...searchResults
              .map((data) => _buildListItem(context, data))
              .toList(),
        ]);
  }

  TableRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    // final fitness = Fitness.fromSnapshot(data);
    return TableRow(children: [
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return FitnessDetailScreen(fitnessname: "운동이름");
              }));
        },
        child: Text("운동이름",
            style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
      ),
      Text("운동부위", style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
      // To get this value, we have to initialize personal fitness collection of firebase
      // TODO : convert document name in fitness collection to fitness name
      // And create every collection for each fitness,
      // Add document with name 'uid' of each user contains values of RM and Record num
      Text("0", style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
      Text("0", style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Text("Fitness List", style: TextStyle(fontSize: 18)),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            // flex: 6,
            child: TextField(
              focusNode: focusNode,
              style: TextStyle(fontSize: 15),
              autofocus: true,
              controller: _filter,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(157, 172, 220, 100),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white60,
                  size: 20,
                ),
                suffixIcon: focusNode.hasFocus
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _fitnessSearchText = "";
                          });
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: 20,
                        ),
                      )
                    : Container(),
                hintText: '검색',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          // replace with firebase
          _buildBody(context),
        ],
      ),
    );
  }
}
