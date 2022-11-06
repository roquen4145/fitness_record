import 'package:fitness_record/widget/fitness_form.dart';
import 'package:flutter/material.dart';

import '../db/fitness_database.dart';
import '../model/fitness_model.dart';
import 'dart:developer';

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
  late String memo;

  @override
  void initState() {
    super.initState();

    name = widget.fitness?.name ?? '';
    bodypart = widget.fitness?.bodypart ?? '';
    memo = widget.fitness?.memo ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
            key: _formKey,
            child: FitnessFormWidget(
              name: name,
              bodypart: bodypart,
              onChangedName: (name) => setState(() => this.name = name),
              onChangedBodypart: (bodypart) =>
                  setState(() => this.bodypart = bodypart),
              onChangedMemo: (memo) => setState(() => this.memo = memo),
            )),
      );

  Widget buildButton() {
    final isFormValid = name.isNotEmpty && bodypart.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateFitness,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateFitness() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.fitness != null;
      log("Trying to add or update");
      if (isUpdating) {
        await updateFitness();
      } else {
        await addFitness();
      }
      log("added or updated");
      Navigator.of(context).pop();
    }
    else {
      log("Invalid");
    }
  }

  Future updateFitness() async {
    final note = widget.fitness!.copy(
      name : name,
      bodypart: bodypart,
      memo: memo
    );

    await FitnessDatabase.instance.update(note);
  }

  Future addFitness() async {
    final note = Fitness(
      name: name,
      bodypart: bodypart,
      uid: '',
      memo: memo,
      rm: 0.0,
    );

    await FitnessDatabase.instance.create(note);
  }
}
