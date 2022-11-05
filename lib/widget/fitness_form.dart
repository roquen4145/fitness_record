import 'package:flutter/material.dart';

class FitnessFormWidget extends StatelessWidget {
  final String? name;
  final String? bodypart;
  final String? memo;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedBodypart;
  final ValueChanged<String> onChangedMemo;

  const FitnessFormWidget({
    Key? key,
    this.name = '',
    this.bodypart = '',
    this.memo = '',
    required this.onChangedName,
    required this.onChangedBodypart,
    required this.onChangedMemo,
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
              buildMemo(),
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

  Widget buildMemo() => TextFormField(
    maxLines: 1,
    initialValue: memo,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'input any memo',
      hintStyle: TextStyle(color: Colors.black12),
    ),
    validator: (memo) => memo != null && memo.isEmpty
        ? 'The memo cannot be empty'
        : null,
    onChanged: onChangedMemo,
  );
}
