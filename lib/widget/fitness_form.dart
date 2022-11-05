import 'package:flutter/material.dart';

class FitnessFormWidget extends StatelessWidget {
  final String? name;
  final String? bodypart;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedBodypart;

  const FitnessFormWidget({
    Key? key,
    this.name = '',
    this.bodypart = '',
    required this.onChangedName,
    required this.onChangedBodypart,
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
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'fitness name',
          hintStyle: TextStyle(color: Colors.black12),
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'The fitness name cannot be empty' : null,
        onChanged: onChangedName,
      );

  Widget buildBodypart() => TextFormField(
        maxLines: 1,
        initialValue: bodypart,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'bodypart (chest,back,leg)',
          hintStyle: TextStyle(color: Colors.black12),
        ),
        validator: (bodypart) => bodypart != null && bodypart.isEmpty
            ? 'The bodypart cannot be empty'
            : null,
        onChanged: onChangedBodypart,
      );
}
