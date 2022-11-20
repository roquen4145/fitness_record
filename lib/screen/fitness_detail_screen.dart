import "package:flutter/material.dart";

import '../model/fitness_model.dart';

class FitnessDetailScreen extends StatefulWidget {
  const FitnessDetailScreen({Key? key, required this.fitness})
      : super(key: key);
  final Fitness fitness;

  @override
  State<FitnessDetailScreen> createState() => _FitnessDetailScreenState();
}

class _FitnessDetailScreenState extends State<FitnessDetailScreen> {
  late List<FitnessRecord> fitnessRecords;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Text("운동 부위",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Text(widget.fitness.bodypart),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text("운동 방법",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          // TODO: add how to area
          Text("역시 마찬가지로, 단순히 고통이라는 이유 때문에 고통 그 자체를 사랑하거나 추구하거나 소유하려는 자는 없다."),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text("메모",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Text(widget.fitness.memo),
          Padding(
            padding: EdgeInsets.all(20),
          ),
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
              // To load this values, we have to create detail collection
              // with key { fitness_id, date }
              // and we have to add database works
              // load_fitness_set_info(fitness_id, today);
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
          Padding(
            padding: EdgeInsets.all(40),
          ),
          Container(
            child: Center(
              child: Text("Graph Area"),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text(widget.fitness.name),
        centerTitle: true,
      ),
    );
  }
}
