import 'package:sqflite/sqflite.dart';

import '../../../infra/sqlite/database.dart';

class UserDatasource {
  static Future insertUser(Map<String, dynamic> user) async {
    final db = await DMDatabase.getDatabase();
    await db.insert(
      DMDatabase.userTableName,
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
