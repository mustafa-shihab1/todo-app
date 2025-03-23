import 'package:sqflite/sqflite.dart';
import '../../../../../config/constants.dart';
import '../../../../../core/storage/local/database/provider/database_operations.dart';
import '../../../../../core/storage/local/database/provider/database_provider.dart';

import '../model/note.dart';

class NoteDatabaseController extends DatabaseOperations<Note> {
  Database? database = DatabaseProvider().database;
  @override
  Future<int> create(Note object) async {
    return await database!.insert(Constants.notesTableName, object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int countItemsDeleted = await database!.delete(Constants.notesTableName,
        where: '${Constants.notesIdColumnName} = ?', whereArgs: [id]);
    return countItemsDeleted > 0;
  }

  @override
  Future<List<Note>> read() async {
    List<Map<String, Object?>> data =
        await database!.query(Constants.notesTableName);
    // List<Note> notes = [];
    // for (Map<String, Object?> note in data) {
    //   notes.add(Note.fromMap(note));
    // }
    // return notes;
    return data.map((row) => Note.fromMap(row)).toList();
  }

  // @override
  // Future<Note?> show(int id) async {
  //   List<Map<String, Object?>> data = await database!.query(
  //       Constants.notesTableName,
  //       where: '${Constants.notesIdColumnName} = ?',
  //       whereArgs: [id]);
  //   return data.isNotEmpty ? Note.fromMap(data.first) : null;
  // }

  @override
  Future<bool> update(Note object) async {
    int countItemsUpdated = await database!.update(
        Constants.notesTableName, object.toMap(),
        where: '${Constants.notesIdColumnName} = ?', whereArgs: [object.id]);
    return countItemsUpdated > 0;
  }

  Future<List<Note>?> searchByTitle(String title) async {
    List<Map<String, Object?>> data = await database!.query(
        Constants.notesTableName,
        where: '${Constants.notesTitleColumnName} = ?',
        whereArgs: [title]);
    return data.isNotEmpty
        ? data.map((row) => Note.fromMap(row)).toList()
        : null;
  }
}
