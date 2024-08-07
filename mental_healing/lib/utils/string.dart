// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension StringEx on String {
  bool get isString => RegExp('[a-zA-Z]').hasMatch(this);

  bool get validCharSpec => RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);

  String formatDecimal(String s) {
    return s.replaceAll('', '');
  }

  String removeAllSpace() {
    // ignore: unnecessary_this
    return this.replaceAll(RegExp(r'\s+'), '');
  }

  String formatToYYYYMMDD() {
    final DateTime dateTime = DateTime.parse(this).toLocal();
    final DateFormat formatter = DateFormat('yyyy / M / d');
    return formatter.format(dateTime);
  }

  String formatToMMYYYY() {
    final DateTime dateTime = DateTime.parse(this).toLocal();
    final DateFormat formatter = DateFormat('MM/yyyy');
    return formatter.format(dateTime);
  }

  String replaceSemicolon({String fromDecimal = '', String toDecimal = ''}) {
    return replaceAll(fromDecimal, toDecimal);
  }

  DateTime convertStringToDate() {
    return DateFormat('dd/MM/yyyy').parse(this);
  }

  // 2022-05-24T10:37:33Z
  DateTime convertToDateType1() {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this);
  }

  // 4/26/2022 12:00:00 AM
  DateTime convertToDateType2() {
    return DateFormat('MM/dd/yyyy HH:mm:ss aaa').parse(this);
  }

  String formatToHHMM() {
    final DateTime dateTime = DateTime.parse(this);
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  String formatToGroup() {
    final DateTime dateTime = DateTime.parse(this);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  String? formatToMMDD() {
    final DateTime result = DateFormat('yyyy-MM-dd HH:mm:ss').parse(this);
    final DateFormat output =
        DateFormat('M/d（${_getNameOfDay(result.weekday)})');
    return output.format(result);
  }

  String? formatToYYMMDDHHmm() {
    final DateTime result = DateFormat('yyyy-MM-dd HH:mm:ss').parse(this);
    final DateFormat output = DateFormat('yyyy/MM/dd HH:mm');
    return output.format(result);
  }

  num formatNumber() {
    return num.tryParse(replaceSemicolon()) ?? 0;
  }

  String? getTimeH() {
    final DateTime result = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this);
    final DateFormat output = DateFormat('HH:mm');
    return output.format(result);
  }

  String? getTimeD() {
    final DateTime result = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this);
    final DateFormat output = DateFormat('dd/MM');
    return output.format(result);
  }

  String? getTimeDDMMYYYY() {
    final DateTime result = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this);
    final DateFormat output = DateFormat('dd/MM/yyyy');
    return output.format(result);
  }

  double get parseNumeric => double.parse(this);

  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool validateMobile() {
    return RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[/0-9]*$').hasMatch(this);
  }

  // \.\-

  bool validateUserName() {
    return RegExp(
            r'^[A-Za-z][a-zA-Z0-9]([_](?![_])|[a-zA-Z0-9]){3,1000}[a-zA-Z0-9]$')
        .hasMatch(this);
  }

  bool validateNumber() {
    const String pattern = r'^[0-9]\d*$';
    return RegExp(pattern).hasMatch(this);
  }

  bool validatePhoneNumber() {
    final numericRegex = RegExp(r'^[0-9]*$');
    if (trim().isEmpty) {
      return false;
    } else if (!numericRegex.hasMatch(trim().split('').first) ||
        !numericRegex.hasMatch(trim().split('').last)) {
      return false;
    } else if (_containOtherSpecialExceptSpaceAndDash()) {
      return false;
    } else if (_containDoubleSpaceOrDash()) {
      return false;
    } else if (_validNumberOfNumberic()) {
      return true;
    }
    return false;
  }

  bool _containOtherSpecialExceptSpaceAndDash() {
    final numericRegex = RegExp(r'^[0-9]*$');
    final arr = trim().split('');
    bool result = false;
    for (final e in arr) {
      if (!numericRegex.hasMatch(e) && e != ' ' && e != '-') {
        result = true;
      }
    }
    return result;
  }

  bool _containDoubleSpaceOrDash() {
    if (contains('--') || contains('  ')) {
      return true;
    }
    return false;
  }

  bool _validNumberOfNumberic() {
    final numericRegex = RegExp(r'^[0-9]*$');
    final arr = trim().split('');
    int count = 0;
    for (final e in arr) {
      if (numericRegex.hasMatch(e)) {
        count++;
      }
    }
    if (count > 9 && count < 12) {
      return true;
    }
    return false;
  }

  bool validatePassword() {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }

  bool validateURL() {
    return RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+')
        .hasMatch(this);
  }

  bool validateValidPass() {
    const String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,40}$';
    return RegExp(pattern).hasMatch(this);
  }

  bool structureEx() {
    const String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    return RegExp(pattern).hasMatch(this);
  }

  bool validateLinks() {
    const String pattern =
        r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)';
    return RegExp(pattern).hasMatch(this);
  }

  bool validateImage() {
    const String pattern = r'.png|.jpg|.jpeg';
    return RegExp(pattern).hasMatch(this);
  }

  bool checkPngFile() {
    const String pattern = r'.png';
    return RegExp(pattern).hasMatch(this);
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String _getNameOfDay(int value) {
    switch (value) {
      case 1:
        return '月';
      case 2:
        return '火';
      case 3:
        return '水';
      case 4:
        return '木';
      case 5:
        return '金';
      case 6:
        return '土';
      case 7:
        return '日';
      default:
        return '';
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

extension StringExNull on String? {
  bool get isStringNotEmpty => this != null && this!.trim().isNotEmpty;

  bool get isStringEmpty => this != null && this!.trim().isEmpty;

  bool get isString => RegExp('[a-zA-Z]').hasMatch(this!);

  bool get isNumeric {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }
}
