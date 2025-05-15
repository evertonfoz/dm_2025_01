import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DMDatabase {
  static const _databaseName = 'dm.db';
  static const userTableName = 'users';

  static Future getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return openDatabase(
      path,
      version: 3,
      onCreate: (db, version) {
        return db.execute('''
            CREATE TABLE $userTableName(
              id INTEGER PRIMARY KEY, 
              email TEXT, 
              senha TEXT)''');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          db.execute('''
            ALTER TABLE $userTableName ADD COLUMN name TEXT''');
        }
        if (oldVersion < 3) {
          db.execute('''
            ALTER TABLE $userTableName ADD COLUMN password TEXT''');
        }
      },
    );
  }
}
