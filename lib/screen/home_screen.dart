import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness Record"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Workout Plan",
            style: TextStyle(fontSize: 18),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: Column(
                children: [
                  Text("Mon"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("상체"),
                  Icon(Icons.check)
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text("Thu"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("하체"),
                  Icon(Icons.check)
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text("Wed"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("휴식"),
                  Icon(Icons.check)
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text("Thu"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("상체"),
                  Icon(Icons.check)
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text("Fri"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("하체"),
                  Icon(Icons.close)
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text("Sat"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("휴식"),
                  Icon(Icons.close)
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text("Sun"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("휴식"),
                  Icon(Icons.close)
                ],
              )),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Workout Record",
            style: TextStyle(fontSize: 18),
          ),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2022, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            locale: 'ko-KR',
            daysOfWeekHeight: 30,
          )
        ],
      ),
    );
  }
}
