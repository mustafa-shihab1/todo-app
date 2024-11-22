import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeController extends GetxController {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentMonthDays = [];
  int selectedDayIndex = DateTime.now().day - 1;

  final itemController = ItemScrollController();

  String getFullDate() => DateFormat('MMMM dd, y').format(currentDate);

  String getDate(date) => DateFormat('dd').format(date);

  String getDay(date) => DateFormat('EEE').format(date);

  String getMonth(date) => DateFormat('MMM').format(date);

  String getYear(date) => DateFormat('y').format(date);

  void changeDay(DateTime date) {
    selectedDate = date;
    update();
  }
}
