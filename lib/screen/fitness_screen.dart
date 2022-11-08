import 'package:fitness_record/screen/fitness_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../db/fitness_database.dart';
import '../model/fitness_model.dart';
import 'add_edit_fitness_screen.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({Key? key}) : super(key: key);

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _fitnessSearchText = "";
  late List<Fitness> fitness_list;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshFitnessList();
  }

  Future refreshFitnessList() async {
    setState(() => isLoading = true);

    fitness_list = await FitnessDatabase.instance.readAllFitness();

    setState(() => isLoading = false);
  }

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
          SizedBox(height: 10),
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : fitness_list.isEmpty
                    ? Text('No Fitnesss', style: TextStyle(fontSize: 24))
                    : buildFitnessList(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(157, 172, 220, 100),
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditFitnessScreen()),
          );

          refreshFitnessList();
        },
      ),
    );
  }

  Widget buildFitnessList() => StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemBuilder: (context, index) {
          final fitness = fitness_list[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      FitnessDetailScreen(fitnessname: fitness.name)));

              refreshFitnessList();
            },
            // child: FitnessCardWidget()
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      );
}

/*
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
          ...searchResults
              .map((data) => _buildListItem(context, data))
              .toList(),
        ]);
 */
