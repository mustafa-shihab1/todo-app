import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/storage/local/database/controller/note_database_controller.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/storage/local/database/model/note.dart';
import '../../../config/constants.dart';

class HomeController extends GetxController with CustomSnackBar {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<Note> notes = [];
  List<Note> completedNotes = [];

  final NoteDatabaseController _noteDatabaseController =
      NoteDatabaseController();

  // Future<void> show(int noteId) async {
  //   currentNote = await _noteDatabaseController.show(noteId) ?? Note();
  //   update();
  // }

  Future<void> read() async {
    notes.clear();
    notes = await _noteDatabaseController.read();
    update();
  }

  Future<void> delete(int? id, BuildContext context) async {
    if (await _noteDatabaseController.delete(id!)) {
      showSnackBar(context: context, message: 'Note Deleted Successfully');
      read();
      readCompletedNotes();
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
    titleController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    read();
  }

  TextEditingController? titleController;
  TextEditingController? descController;
  TextEditingController? dateController;
  TextEditingController? timeController;
  // final HomeController _homeController = Get.find<HomeController>();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  String? selectedOption;
  List<String> repeatOptions = [
    "Once",
    "Daily",
    "Weekly",
    "Monthly",
  ];

  Future<void> selectDate(context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (selectedDate != null) {
      dateController?.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      update();
    }
  }

  Future<void> selectTime(context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      timeController!.text = selectedTime.format(context).toString();
      update();
    }
  }

  Future<void> performCreation() async {
    Note note = Note(
        title: titleController!.text.toString(),
        desc: descController!.text.toString(),
        time: timeController!.text.toString(),
        date: dateController!.text.toString(),
        repeat: selectedOption);
    bool isCreated = await create(note: note);
    if (isCreated) {
      print('New Note Created Successfully');
      Get.back();
      print("Title: ${titleController!.text}");
      print("Desc: ${descController!.text}");
      print("Date: ${dateController!.text}");
      print("Time: ${timeController!.text}");

      update();
    } else {
      print('Creating Failed!!');
    }
  }

  void initControllers(noteIndex) {
    Note note = notes[noteIndex];
    titleController!.text = note.title ?? '';
    descController!.text = note.desc ?? '';
    dateController!.text = note.date ?? '';
    timeController!.text = note.time ?? '';
    selectedOption = note.repeat;
  }

  void clearControllers() {
    titleController!.clear();
    descController!.clear();
    dateController!.clear();
    timeController!.clear();
    selectedOption = null;
  }

  Future<void> performUpdate(int index) async {
    Note note = notes[index];
    note.title = titleController!.text;
    note.desc = descController!.text;
    note.date = dateController!.text;
    note.time = timeController!.text;
    note.repeat = selectedOption;
    bool isUpdated = await updateNote(updatedNote: note);
    if (isUpdated) {
      print('Note Updated Successfully');
      update();
      Get.back();
    } else {
      print('Updating Failed!!');
    }
  }

  Future<void> readCompletedNotes() async {
    completedNotes.clear();
    completedNotes = await _noteDatabaseController.readCompleted();
    update();
  }

  Future<void> completeNote(Note note) async {
    bool isUpdated = await _noteDatabaseController.markAsCompleted(note);
    if (isUpdated) {
      note.isCompleted = 1;
      readCompletedNotes();
      notes.removeWhere((element) => element.id == note.id);
      update();
    }
  }
}
