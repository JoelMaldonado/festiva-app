import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format({
    String pattern = 'dd/MM/yyyy',
  }) {
    return DateFormat(pattern).format(this);
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
