import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  DateTime currentDate = DateTime.now();
  List<DateTime> currentMonthDays = [];
  int selectedDayIndex = DateTime.now().day - 1;

  String getFullDate() => DateFormat('MMMM dd, y').format(currentDate);

  String getDate(currentDate) => DateFormat('dd').format(currentDate);

  String getDay(currentDate) => DateFormat('EEE').format(currentDate);

  String getMonth(currentDate) => DateFormat('MMM').format(currentDate);

  int numberOfDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28;
    }
    return [4, 6, 9, 11].contains(month) ? 30 : 31;
  }

  void getCurrentMonthDays() {
    final now = DateTime.now();
    final days = numberOfDaysInMonth(now.year, now.month);

    currentMonthDays = List.generate(
      days,
      (index) => DateTime(now.year, now.month, index + 1),
    );
  }

  void changeSelectedDay(int index) {
    selectedDayIndex = index;
    update();
  }

  @override
  void onInit() {
    getCurrentMonthDays();
    super.onInit();
  }
}
