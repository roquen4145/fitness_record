import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final period = ["일", "주", "월"];
  int selectedPeriod = 0;

  List<Widget> _buildItems1() {
    return period
        .map((val) => MySelectionItem(
      title: val,
    ))
        .toList();
  }

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
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("매 N "),
                Container(
                  width: 70,
                  height: 40,
                  child: DirectSelect(
                    itemExtent: 60,
                    items: _buildItems1(),
                    child: MySelectionItem(
                      isForList: false,
                      title: period[selectedPeriod]
                    ),
                    onSelectedItemChanged: (index){
                      setState(() {
                        selectedPeriod = index!;
                      });
                    },
                  ),
                ),
                Text("마다 N번 운동하기"),
              ],
            ),
          ]),
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

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key? key, required this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
        child: _buildItem(context),
        padding: EdgeInsets.all(10.0),
      )
          : Card(
        child: Stack(
          children: <Widget>[
            _buildItem(context),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }
  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}