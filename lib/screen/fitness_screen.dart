import 'package:fitness_record/screen/fitness_detail_screen.dart';
import 'package:flutter/material.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({Key? key}) : super(key: key);

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Fitness List", style: TextStyle(fontSize: 18)),
          // replace with firebase
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
            border: TableBorder.all(style: BorderStyle.none),
            children: [
              TableRow(children: [
                Text("운동이름",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text("부위",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text("RM",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
              TableRow(
                  children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,builder: (BuildContext context){
                      return FitnessDetailScreen(fitnessname: "벤치 프레스");
                    }));
                  },
                  child: Text("벤치 프레스",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                ),
                Text("가슴",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
                Text("100",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,builder: (BuildContext context){
                      return FitnessDetailScreen(fitnessname: "데드리프트");
                    }));
                  },
                  child: Text("데드리프트",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                ),
                Text("등",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
                Text("100",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,builder: (BuildContext context){
                      return FitnessDetailScreen(fitnessname: "스쿼트");
                    }));
                  },
                  child: Text("스쿼트",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center),
                ),
                Text("허벅지",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
                Text("100",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
