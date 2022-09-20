import "package:flutter/material.dart";

class FitnessDetailScreen extends StatelessWidget {
  const FitnessDetailScreen({Key? key, required this.fitnessname}) : super(key: key);
  final String fitnessname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(fitnessname, style: TextStyle(fontSize: 18, color: Colors.black),))
        ],
      ),
      appBar: AppBar(
        title: Text(fitnessname),
        centerTitle: true,
      ),
    );
  }
}
