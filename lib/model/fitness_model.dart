import 'package:cloud_firestore/cloud_firestore.dart';

class Fitness {
  final String name;
  final String bodypart;
  final DocumentReference? reference;

  Fitness.fromMap(Map<String, dynamic> map, {this.reference})
  : name = map['name'],
    bodypart = map['bodypart'];

  Fitness.fromSnapshot(DocumentSnapshot snapshot)
  : this.fromMap(snapshot.data() as Map<String,dynamic>, reference: snapshot.reference);

  @override
  String toString() => "Fitness<$name:$bodypart>";
}