import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'utang.dart';

class UtangHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String AMOUNT = 'amount';
  static const String ABOUT = 'about';
  static const String UTANGDATE = 'utangdate';
  static const String TABLE = 'utangtable';
  static const String DB_NAME = 'uberutang.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE $TABLE 
        ($ID INTEGER PRIMARY KEY,
         $NAME TEXT, $AMOUNT INTEGER, $ABOUT TEXT, $UTANGDATE TEXT)""");
  }

  Future<Utang> save(Utang utang) async {
    var dbClient = await db;
    utang.id = await dbClient.insert(TABLE, utang.toMap());
    return utang;
  }

  Future<List<Utang>> getUtangs() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(TABLE, columns: [ID, NAME, AMOUNT, ABOUT, UTANGDATE]);
    List<Utang> utangs = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        utangs.add(Utang.fromMap(maps[i]));
      }
    }
    return utangs;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(Utang utang) async {
    var dbClient = await db;
    return await dbClient
        .update(TABLE, utang.toMap(), where: '$ID = ?', whereArgs: [utang.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
