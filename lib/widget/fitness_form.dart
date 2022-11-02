import 'package:flutter/material.dart';

class FitnessFormWidget extends StatelessWidget {
  final String? name;
  final String? bodypart;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const FitnessFormWidget({
    Key? key,
    this.name = '',
    this.bodypart = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildName(),
          SizedBox(height: 8),
          buildBodypart(),
          SizedBox(height: 16),
        ],
      ),
    ),
  );

  Widget buildName() => TextFormField(
    maxLines: 1,
    initialValue: name,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Title',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'The title cannot be empty' : null,
    onChanged: onChangedTitle,
  );

  Widget buildBodypart() => TextFormField(
    maxLines: 5,
    initialValue: bodypart,
    style: TextStyle(color: Colors.white60, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Type something...',
      hintStyle: TextStyle(color: Colors.white60),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The description cannot be empty'
        : null,
    onChanged: onChangedDescription,
  );
}