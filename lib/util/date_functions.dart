import 'package:intl/intl.dart';

String? formatDate(DateTime? date, {String format = 'dd/MM/yyyy'}) {
  if (date == null) return null;
  final formatter = DateFormat(format);
  return formatter.format(date);
}

DateTime? parseDatetime(String? datetime) {
  if (datetime == null) return null;
  return DateTime.parse(datetime); //.toLocal();
}

DateTime? parseDate(String? date) {
  if (date == null) return null;
  return DateFormat('yyyy-MM-dd').parse(date);
}
