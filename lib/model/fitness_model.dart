final String tableFitness = 'fitness';
final String tableFitnessRecord = 'fitnessRecord';

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
  static final List<String> values = [fid, setNum, weight, time];
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
      rm: double.parse(json[FitnessFields.rm].toString()));

  Map<String, Object?> toJson() => {
        FitnessFields.id: id,
        FitnessFields.name: name,
        FitnessFields.bodypart: bodypart,
        FitnessFields.uid: uid,
        FitnessFields.memo: memo,
        FitnessFields.rm: rm.toString(),
      };
}

class FitnessRecord {
  int fid;
  int setNum;
  double weight;
  String time;

  FitnessRecord(
      {required this.fid,
      required this.setNum,
      required this.weight,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'fid': fid,
      'setNum': setNum,
      'weight': weight,
      'time': time,
    };
  }

  static fromJson(Map<String, Object?> json) => FitnessRecord(
      fid: json[FitnessRecordFields.fid] as int,
      setNum: json[FitnessRecordFields.setNum] as int,
      weight: double.parse(json[FitnessRecordFields.weight].toString()),
      time: json[FitnessRecordFields.time].toString());
}
