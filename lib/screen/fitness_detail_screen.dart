import "package:flutter/material.dart";

class FitnessDetailScreen extends StatelessWidget {
  const FitnessDetailScreen({Key? key, required this.fitnessname}) : super(key: key);
  final String fitnessname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(10),),
          Text("운동 방법", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Text("역시 마찬가지로, 단순히 고통이라는 이유 때문에 고통 그 자체를 사랑하거나 추구하거나 소유하려는 자는 없다."),
          Padding(padding: EdgeInsets.all(20),),
          Text("기구 세팅", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(padding: EdgeInsets.all(20),),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
            border: TableBorder.all(style: BorderStyle.none),
            children: [
              TableRow(children: [
                Text("세트 수",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text("무게",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text("횟수",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Text("1",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("50",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("12",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Text("2",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("60",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("10",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Text("3",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("70",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                Text("8",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Container(),
                Icon(Icons.add), // add a new row
                Container(),
              ]),
            ],
          ),
          Padding(padding: EdgeInsets.all(40),),
          Container(
            child: Center(
              child: Text("Graph Area"),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text(fitnessname),
        centerTitle: true,
      ),
    );
  }
}
