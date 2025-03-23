import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../config/constants.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  Database? _database;

  DatabaseProvider._internal();

  factory DatabaseProvider() {
    return _instance;
  }

  Database? get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.databaseName);
    _database = await openDatabase(
      path,
      version: Constants.databaseFirstVersion,
      onCreate: (db, version) async {
        print('DB created');
        return await db
            .execute('CREATE TABLE '
                '${Constants.notesTableName}('
                '${Constants.notesIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT,'
                '${Constants.notesTitleColumnName} TEXT,'
                '${Constants.notesDescColumnName} TEXT,'
                '${Constants.notesDateColumnName} TEXT,'
                '${Constants.notesTimeColumnName} TEXT,'
                '${Constants.notesRepeatColumnName} TEXT)')
            .then(
              (value) => print('Table created'),
            );
      },
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }
}
