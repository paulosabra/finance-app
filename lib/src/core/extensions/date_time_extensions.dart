import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String? formatDateTime() {
    return DateFormat('MMM d, yyyy').format(this);
  }
}
