import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:uberutang/models/user.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    await _database.rawInsert('''
     INSERT INTO users(
        username, password
      ) VALUES (?, ?)
    ''', ['uber', 'utang']);
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'uberutang.db'),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users (
          username TEXT PRIMARY KEY, password TEXT)
        ''');
    }, version: 1);
  }

  initUser() async {
    final db = await database;

    var res = await db.rawInsert('''
     INSERT INTO users(
        username, password
      ) VALUES (?, ?)
    ''', ['uber', 'utang']);

    return res;
  }

  newUser(User newUser) async {
    final db = await database;

    // var res = await db.rawInsert('''
    //   INSERT INTO users(
    //     username, password
    //   ) VALUES (?, ?)
    // ''', [newUser.username, newUser.password]);

    var res = await db
        .query('users', where: 'username = ?', whereArgs: [newUser.username]);

    print('done');
    return res;
  }

  newLogin(User newLogin) async {
    final db = await database;

    var res = await db.query('users',
        where: 'username = ? and password = ?',
        whereArgs: [newLogin.username, newLogin.password]);
    if (res.length == 1) {
      return true;
    }
    return false;
  }

  Future<dynamic> getUser() async {
    final db = await database;
    var res = await db.query("users");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}
