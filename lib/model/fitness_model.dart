class Fitness {
  final int id;
  final String name;
  final String bodypart;
  final String uid;
  final String memo;
  final double rm;

  Fitness(
      {required this.id,
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
  final String uid;
  final int fid;
  final int setNum;
  final double weight;
  final DateTime time;

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
