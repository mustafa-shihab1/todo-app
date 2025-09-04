import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
// INITIALIZE
  Future<void> initNotification() async {
    if (_isInitialized) return; // prevent re-initialization

    // init timezone
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // prepare android init settings
    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // prepare ios init settings
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // init settings
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    // initialize the plugin
    await notificationsPlugin.initialize(initSettings);
    _isInitialized = true;
  }

// NOTIFICATIONS DETAIL SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

// SHOW NOTIFICATION
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
      payload: payload,
    );
  }

// SHOW SCHEDULED NOTIFICATION
  // Future<void> scheduledNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  //   required DateTime scheduledDate,
  // }) async {
  //   // create timezone for today at specified hour and minute
  //   final scheduledDateNotification =
  //       tz.TZDateTime.from(scheduledDate, tz.local);

  //   // Schedule the notification
  //   await notificationsPlugin.zonedSchedule(
  //       id, title, body, scheduledDateNotification, notificationDetails(),
  //       matchDateTimeComponents: DateTimeComponents.time,
  //       androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle);
  // }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
    required String repeat, // 'Once', 'Daily', 'Weekly', 'Monthly'
  }) async {
    final scheduledDate = tz.TZDateTime.from(dateTime, tz.local);
//  if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) {
//     throw ArgumentError(
//         '====> Scheduled date must be in the future: $scheduledDate');
//   }
//   print('scheduledDate: $scheduledDate');
// print('now: ${tz.TZDateTime.now(tz.local)}');

    switch (repeat) {
      case 'Once':
        await notificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          scheduledDate,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'main_channel',
              'Main Channel',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
        break;

      case 'Daily':
        await notificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          _nextInstanceDaily(scheduledDate),
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'main_channel',
              'Main Channel',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          matchDateTimeComponents: DateTimeComponents.time,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
        break;

      case 'Weekly':
        await notificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          _nextInstanceWeekly(scheduledDate),
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'main_channel',
              'Main Channel',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
        break;

      case 'Monthly':
        await notificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          _nextInstanceMonthly(scheduledDate),
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'main_channel',
              'Main Channel',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
        break;
    }
  }

  tz.TZDateTime _nextInstanceDaily(tz.TZDateTime dateTime) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, dateTime.hour, dateTime.minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(Duration(days: 1));
    }
    return scheduled;
  }

  tz.TZDateTime _nextInstanceWeekly(tz.TZDateTime dateTime) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, dateTime.hour, dateTime.minute);
    while (scheduled.isBefore(now)) {
      scheduled = scheduled.add(Duration(days: 1));
    }
    return scheduled;
  }

  tz.TZDateTime _nextInstanceMonthly(tz.TZDateTime dateTime) {
    final now = tz.TZDateTime.now(tz.local);
    var nextMonth = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
    );
    if (nextMonth.isBefore(now)) {
      nextMonth = tz.TZDateTime(
        tz.local,
        now.year,
        now.month + 1,
        dateTime.day,
        dateTime.hour,
        dateTime.minute,
      );
    }
    return nextMonth;
  }
}
