final String tableFitness = 'fitness';

class FitnessFields {
  static final List<String> values = [id, name, bodypart, uid, memo, rm];

  static final String id = '_id';
  static final String name = 'name';
  static final String bodypart = 'bodypart';
  static final String uid = 'uid';
  static final String memo = 'memo';
  static final String rm = 'rm';
}

class FitnessRecordFields {
  static final List<String> values = [uid, fid, setNum, weight, time];

  static final String uid = 'uid';
  static final String fid = 'fid';
  static final String setNum = 'setNum';
  static final String weight = 'weight';
  static final String time = 'time';
}

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

  Fitness copy(
          {int? id,
          String? name,
          String? bodypart,
          String? uid,
          String? memo,
          double? rm}) =>
      Fitness(
          id: id ?? this.id,
          name: name ?? this.name,
          bodypart: bodypart ?? this.bodypart,
          uid: uid ?? this.uid,
          memo: memo ?? this.memo,
          rm: rm ?? this.rm);

  static Fitness fromJson(Map<String, Object?> json) => Fitness(
      id: json[FitnessFields.id] as int?,
      name: json[FitnessFields.name] as String,
      bodypart: json[FitnessFields.bodypart] as String,
      uid: json[FitnessFields.uid] as String,
      memo: json[FitnessFields.memo] as String,
      rm: json[FitnessFields.rm] as double);

  Map<String, Object?> toJson() => {
    FitnessFields.id : id,
    FitnessFields.name : name,
    FitnessFields.bodypart : bodypart,
    FitnessFields.uid : uid,
    FitnessFields.memo : memo,
    FitnessFields.rm : rm,
  };
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
