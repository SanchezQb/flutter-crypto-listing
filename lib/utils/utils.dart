import 'package:intl/intl.dart';

class Utils {
  static final f = NumberFormat("#,##0.000", "en_US");
  static String formatNumber(value) {
    return f.format(value);
  }
}
