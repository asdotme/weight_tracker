import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "WeightTracker.db";
  static const _databaseVersion = 1;

  static const table = 'weights';
  static const columnId = '_id';
  static const columnWeight = 'weight';
  static const columnDate = 'date';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $columnWeight TEXT NOT NULL,
            $columnDate INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    if (db == null) return await 0;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    if (db == null) return await null;
    return await db.query(table, orderBy: 'date ASC');
  }
}
