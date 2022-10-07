class Fitness {
  int? id;
  String name;
  String bodypart;
  String uid;
  String memo;
  double rm;

  Fitness(
      {this.id,
      required this.name,
      required this.bodypart,
      required this.uid,
      required this.memo,
      required this.rm});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'bodypart': bodypart,
      'uid': uid,
      'memo': memo,
      'rm': rm,
    };
  }
}

class FitnessRecord {
  String uid;
  int fid;
  int setNum;
  double weight;
  String time;

  FitnessRecord(
      {required this.uid,
      required this.fid,
      required this.setNum,
      required this.weight,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fid': fid,
      'setNum': setNum,
      'weight': weight,
      'time': time,
    };
  }
}
