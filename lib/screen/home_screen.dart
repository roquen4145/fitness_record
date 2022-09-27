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
          Text("N 일/주/월 마다 M번 운동하기"),
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
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          )
        ],
      ),
    );
  }
}
