import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseManager {
  static final DatabaseManager _singleton = DatabaseManager._();
  static DatabaseManager get instance => _singleton;
  DatabaseManager._();

  late Database _database;
  Database get database => _database;

  Future<void> getDatabase() async {
    _database = await _openDatabase();
  }

  Future<Database> _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'fitness.db');
    return await databaseFactoryIo.openDatabase(dbPath);
  }
}
