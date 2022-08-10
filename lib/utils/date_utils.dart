class DateUtils {
  static DateTime convertDateFromString({required String strDate}) {
    return DateTime.parse(strDate);
  }

  static DateTime convertDateFromTimeStamp({required int timestamp}) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
}
