import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/storage/local/database/controller/note_database_controller.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/storage/local/database/model/note.dart';

class HomeController extends GetxController with CustomSnackBar {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<Note> notes = [];

  final NoteDatabaseController _noteDatabaseController =
      NoteDatabaseController();

  // Future<void> show(int noteId) async {
  //   currentNote = await _noteDatabaseController.show(noteId) ?? Note();
  //   update();
  // }

  Future<void> read() async {
    notes = await _noteDatabaseController.read();
    update();
  }

  Future<void> delete(int? id, BuildContext context) async {
    if (await _noteDatabaseController.delete(id!)) {
      showSnackBar(context: context, message: 'Note Deleted Successfully');
      read();
    } else {
      showSnackBar(context: context, message: 'Deleted Faild!!', error: true);
    }
  }

  Future<bool> create({required Note note}) async {
    int id = await _noteDatabaseController.create(note);
    if (id != 0) {
      note.id = id;
      notes.add(note);
      update();
    }
    return id != 0;
  }

  Future<bool> updateNote({required Note updatedNote}) async {
    bool updated = await _noteDatabaseController.update(updatedNote);
    if (updated) {
      for (int i = 0; i < notes.length; i++) {
        if (notes[i].id == updatedNote.id) {
          notes[i] = updatedNote;
          update();
          return true;
        }
      }
    }
    return false;
  }

  String getFullDate() => DateFormat('MMMM dd, y').format(currentDate);

  String getDate(date) => DateFormat('dd').format(date);

  String getDay(date) => DateFormat('EEE').format(date);

  String getMonth(date) => DateFormat('MMM').format(date);

  String getYear(date) => DateFormat('y').format(date);

  void changeDay(DateTime date) {
    selectedDate = date;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    read();
  }
}
