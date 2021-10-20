import 'package:sqflite/sqflite.dart';
import 'database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;

  Repository() {
    // initialize database connection
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  // check if database is exist or not
  Future<Database?> get database async {
    print('repository before if (_database != null) return _database;');
    if (_database != null) return _database;
    print('repository after if (_database != null) return _database;');
    print('before _database = await _databaseConnection.setDatabase();');
    _database = await _databaseConnection.setDatabase();
    print('after _database = await _databaseConnection.setDatabase();');
    return _database;
  }

  // inserting data to table
  insertData(table, data) async {
    var connection = await database;
    return await connection!.insert(table, data);
  }

  // read data from table
  readData(table) async {
    var connection = await database;
    return await connection!.query(table);
  }
}
