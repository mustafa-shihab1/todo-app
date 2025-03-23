import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/storage/local/database/model/note.dart';
import '../../../../features/home/presentation/controller/home_controller.dart';

class TaskController extends GetxController {
  TextEditingController? titleController;
  TextEditingController? descController;
  TextEditingController? dateController;
  TextEditingController? timeController;
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();

  }
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
    bool isCreated = await _homeController.create(note: note);
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
    Note note = _homeController.notes[noteIndex];
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
    Note note = _homeController.notes[index];
    note.title = titleController!.text;
    note.desc = descController!.text;
    note.date = dateController!.text;
    note.time = timeController!.text;
    note.repeat = selectedOption;
    bool isUpdated = await _homeController.updateNote(updatedNote: note);
    if (isUpdated) {
      print('Note Updated Successfully');
      update();
      Get.back();
    } else {
      print('Updating Failed!!');
    }
  }
}
