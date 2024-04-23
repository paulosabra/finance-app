import 'package:intl/intl.dart';

extension NumExtension on num {
  String? formatCurrency() {
    return NumberFormat.currency(
      locale: Intl.defaultLocale,
      symbol: r'$ ',
    ).format(this);
  }
}
