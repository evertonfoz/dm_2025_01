import '../../../infra/sqlite/database.dart';

class LoginDatasource {
  static Future<bool> login(String email, String password) async {
    final db = await DMDatabase.getDatabase();
    final result = await db.query(
      DMDatabase.userTableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isEmpty) {
      return false;
    }
    return true;
  }
}
