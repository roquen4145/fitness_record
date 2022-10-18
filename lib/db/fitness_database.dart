import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fitness_record/model/fitness_model.dart';

class FitnessDatabase {
  static final FitnessDatabase instance = FitnessDatabase._init();

  static Database? _database;

  FitnessDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableFitness ( 
  ${FitnessFields.id} $idType, 
  ${FitnessFields.name} $textType,
  ${FitnessFields.bodypart} $textType,
  ${FitnessFields.uid} $textType,
  ${FitnessFields.memo} $textType,
  ${FitnessFields.rm} $integerType
  )
''');
  }

  Future<Fitness> create(Fitness fitness) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableFitness, fitness.toJson());
    return fitness.copy(id: id);
  }

  Future<Fitness> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableFitness,
      columns: FitnessFields.values,
      where: '${FitnessFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Fitness.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Fitness>> readAllFitness() async {
    final db = await instance.database;

    final orderBy = '${FitnessFields.name} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableFitness, orderBy: orderBy);

    return result.map((json) => Fitness.fromJson(json)).toList();
  }

  Future<int> update(Fitness fitness) async {
    final db = await instance.database;

    return db.update(
      tableFitness,
      fitness.toJson(),
      where: '${FitnessFields.id} = ?',
      whereArgs: [fitness.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableFitness,
      where: '${FitnessFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}