import 'package:intl/intl.dart';

class DateFormatter {
  String getDateFromTimeStamp(int timestamp) {
    try {
      return DateFormat("MMM dd,yyyy hh:mm aa")
          .format(dateTimeFromTimestamp(timestamp));
    } catch (e) {
      throw e.toString();
    }
  }

  DateTime dateTimeFromTimestamp(int timestamp) {
    try {
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    } catch (e) {
      throw e.toString();
    }
  }
}