import 'package:clevit_flutter_bloc/data/models/liquor_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class LiquorLocalDataSource {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  Future<Database> _init() async {
  final path = join(await getDatabasesPath(), 'liquor.db');
  return await openDatabase(path, version: 1, onCreate: (db, version) async {
    await db.execute('''
      CREATE TABLE liquors(
        id TEXT PRIMARY KEY,
        bottleNumber TEXT,
        name TEXT,
        brand TEXT,
        age INTEGER,
        isOpened INTEGER,
        collection TEXT,
        imageUrl TEXT,
        imageAlt TEXT,
        distillery TEXT,
        region TEXT,
        country TEXT,
        type TEXT,
        ageStatement TEXT,
        filled TEXT,
        bottled TEXT,
        caskNumber TEXT,
        abv REAL,
        size TEXT,
        finish TEXT,
        tastingNose TEXT,
        tastingPalate TEXT,
        tastingFinish TEXT,
        userNose TEXT,
        userPalate TEXT,
        userFinish TEXT,
        historyJson TEXT,
        tastingAuthor TEXT,
        videoUrl TEXT
      )
    ''');
  });
}


  Future<void> saveLiquors(List<LiquorModel> liquors) async {
    final database = await db;
    for (var liquor in liquors) {
      await database.insert('liquors', liquor.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<LiquorModel>> getLiquors() async {
    final database = await db;
    final maps = await database.query('liquors');
    return maps.map((e) => LiquorModel.fromMap(e)).toList();
  }
}