import 'package:flutter/material.dart';

import '../db/fitness_database.dart';

class FitnessProfileScreen extends StatefulWidget {
  const FitnessProfileScreen({Key? key}) : super(key: key);

  @override
  State<FitnessProfileScreen> createState() => _FitnessProfileScreenState();
}

class _FitnessProfileScreenState extends State<FitnessProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Profile"),
            Container(),
            TextButton(onPressed: DeleteButton, child: Text("Delete All"))
          ],
        ),
      ),
    );
  }

  void DeleteButton() async {
    await FitnessDatabase.instance.deleteAllFitness();
  }
}
