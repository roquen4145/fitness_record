import 'package:fitness_record/widget/fitness_form.dart';
import 'package:flutter/material.dart';

import '../model/fitness_model.dart';

class AddEditFitnessScreen extends StatefulWidget {
  final Fitness? fitness;

  const AddEditFitnessScreen({Key? key, this.fitness}) : super(key: key);

  @override
  State<AddEditFitnessScreen> createState() => _AddEditFitnessScreenState();
}

class _AddEditFitnessScreenState extends State<AddEditFitnessScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String bodypart;

  @override
  void initState() {
    super.initState();

    name = widget.fitness?.name ?? '';
    bodypart = widget.fitness?.bodypart ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(key: _formKey, child: FitnessFormWidget(
          name: name,
          bodypart: bodypart,
          onChangedTitle: (name) => setState(() => this.name = name),
          onChangedDescription: (bodypart) =>
              setState(() => this.bodypart = bodypart),
        )),
      );

  Widget buildButton() {
    final isFormValid = name.isNotEmpty && bodypart.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: () {},
        child: Text('Save'),
      ),
    );
  }
}
