import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './components/ZipCodeCard/ZipCode.dart';

final tableName = "zip_codes";


class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  Future<Database> database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal() {
    initDatabase();
  }

  initDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'beautiful_alarm.db'),
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE $tableName(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              code TEXT,
              city TEXT,
              stateCode TEXT
            )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertZipCode(ZipCode zipCode) async {
    Database db = await database;
    int id = await db.insert(tableName, zipCode.toMap());
    return id;
  }

  Future<List<ZipCode>> listZipCodes() async {
    // TODO: pass some args
    Database db = await database;
    List<Map> results = await db.query(tableName);
    return results.map((Map result) => ZipCode.fromMap(result)).toList(); 
  }
}
