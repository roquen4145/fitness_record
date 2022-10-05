class Fitness {
  final int id;
  final String name;
  final String bodypart;

  Fitness({required this.id,required this.name,required this.bodypart});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
      'bodypart' : bodypart,
    };
  }
}