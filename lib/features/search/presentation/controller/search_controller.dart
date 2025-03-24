import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/storage/local/database/controller/note_database_controller.dart';
import '../../../../core/storage/local/database/model/note.dart';

class SearchsController extends GetxController {
  List<Note>? searchList = [];
  late TextEditingController searchController;
  final NoteDatabaseController _noteDatabaseController =
      NoteDatabaseController();

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<List<Note>?> search(String title) async {
    searchList = await _noteDatabaseController.searchByTitle(title);
    update();
    return searchList;
  }
}
