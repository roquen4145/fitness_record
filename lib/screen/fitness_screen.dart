import 'package:fitness_record/screen/fitness_detail_screen.dart';
import 'package:flutter/material.dart';

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
          Table(
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
              TableRow(children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return FitnessDetailScreen(fitnessname: "벤치 프레스");
                        }));
                  },
                  child: Text("벤치 프레스",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center),
                ),
                Text("가슴",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("100",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("5",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return FitnessDetailScreen(fitnessname: "데드리프트");
                        }));
                  },
                  child: Text("데드리프트",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center),
                ),
                Text("등",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("100",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("3",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return FitnessDetailScreen(fitnessname: "스쿼트");
                        }));
                  },
                  child: Text("스쿼트",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center),
                ),
                Text("허벅지",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("100",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("1",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
