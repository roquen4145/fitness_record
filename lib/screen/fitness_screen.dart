import 'package:flutter/material.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({Key? key}) : super(key: key);

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "Fitness"
        ),
      ),
    );
  }
}
