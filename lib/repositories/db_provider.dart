import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
// import 'package:subsuclib/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;
  static final _tableName = "Subsuc";

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // DBがなかったら作る
    _database = await initDB();
    return _database;
  }
  //
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // import 'package:path/path.dart'; が必要
    // なぜか サジェスチョンが出てこない
    String path = join(documentsDirectory.path, "SubsucDB.db");

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }
  //
  Future<void> _createTable(Database db, int version) async {

    // sqliteではDate型は直接保存できないため、文字列形式で保存する
    return await db.execute(
        "CREATE TABLE $_tableName ("
            "id TEXT PRIMARY KEY,"
            "name TEXT,"
            "amount INTEGER,"
            "billingtext TEXT,"
            "billingPeriod INTEGER,"
            "startDate TEXT,"
            "pay TEXT"
            ")"
    );
  }

  createSubsuc(Subsuc subsuc) async {
    final db = await database;
    var res = await db.insert(_tableName, subsuc.toMap());
    return res;
  }

  getAllSubsuc() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<Subsuc> list =
    res.isNotEmpty ? res.map((c) => Subsuc.fromMap(c)).toList() : [];
    return list;
  }

  updateSubsuc(Subsuc subsuc) async {
    final db = await database;
    var res  = await db.update(
        _tableName,
        subsuc.toMap(),
        where: "id = ?",
        whereArgs: [subsuc.id]
    );
    return res;
  }

  deleteSubsuc(String id) async {
    final db = await database;
    var res = db.delete(
        _tableName,
        where: "id = ?",
        whereArgs: [id]
    );
    return res;
  }

  deleteDB() async {
    final db = await database;
    var res = db.delete(
        _tableName
    );
    return res;
  }
}