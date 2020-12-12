import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './components/ZipCodeCard/ZipCode.dart';

final DB_NAME = 'ziplock.db';
final TABLE_NAME = 'zipcodes';

class DatabaseService {
  DatabaseService._();

  static final DatabaseService db = DatabaseService._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    print("initDB executed");
    String path = join(await getDatabasesPath(), DB_NAME);
    await deleteDatabase(path);
    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
            '''
            CREATE TABLE IF NOT EXISTS $TABLE_NAME (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              code TEXT,
              city TEXT,
              stateCode TEXT
            );
            ''',
          );
        }
    );
  }

  Future<int> insertZipCode(ZipCode zipCode) async {
    final db = await database;
    int id = await db.insert(TABLE_NAME, zipCode.toMap());
    return id;
  }


  Future<List<ZipCode>> listZipCodes() async {
    // TODO: pass some args
    final db = await database;
    List<Map> results = await db.query(TABLE_NAME);
    return results.map((Map result) => ZipCode.fromMap(result)).toList(); 
  }
}
