import 'package:intl/intl.dart';

class Formatter {
  const Formatter(this.targetString);
  final String? targetString;

  String getDateString() {
    if (targetString == null || targetString!.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(targetString!);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays == 0) {
        return DateFormat('HH:mm').format(dateTime);
      } else if (dateTime.year == now.year) {
        return DateFormat('MM/dd HH:mm').format(dateTime);
      } else {
        return DateFormat('yyyy/MM/dd HH:mm').format(dateTime);
      }
    } catch (e) {
      return '';
    }
  }
}
