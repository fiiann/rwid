import 'package:intl/intl.dart';

String formatDateTimeAsString(dynamic dateTime,
    {String dateFormat = 'dd MMM yy'}) {
  try {
    if (dateTime is DateTime) {
      return DateFormat(dateFormat)
          .format(formatDateTimeToLocal(dateTime.toString()));
    } else {
      return DateFormat(dateFormat).format(formatDateTimeToLocal(dateTime));
    }
  } catch (e) {
    return '-';
  }
}

DateTime formatDateTimeToLocal(dynamic dateTime,
    {String dateFormat = 'dd/MM/yyyy HH:mm'}) {
  return DateFormat(dateFormat)
      .parse(DateFormat(dateFormat).format(DateTime.parse(dateTime)), true)
      .toLocal();
}
