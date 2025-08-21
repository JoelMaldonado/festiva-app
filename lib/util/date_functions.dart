import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format({
    String pattern = 'dd/MM/yyyy',
  }) {
    return DateFormat(pattern).format(this);
  }
}

extension StringExtension on String {
  DateTime toTodayDateTime() {
    final now = DateTime.now();
    final parsed = DateFormat.Hms().parse(this);
    return DateTime(
      now.year,
      now.month,
      now.day,
      parsed.hour,
      parsed.minute,
      parsed.second,
    );
  }

  DateTime toDate({
    String pattern = "yyyy-MM-ddTHH:mm:ss",
  }) {
    return DateFormat(pattern).parse(this);
  }
}

DateTime? parseDatetime(String? datetime) {
  if (datetime == null) return null;
  return DateTime.parse(datetime); //.toLocal();
}

DateTime? parseDate(String? date) {
  if (date == null) return null;
  return DateFormat('yyyy-MM-dd').parse(date);
}
