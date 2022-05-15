import 'package:flutter/services.dart';

class RegExInputFormatter implements TextInputFormatter {
  final RegExp _regExp;

  RegExInputFormatter._(this._regExp);

  factory RegExInputFormatter.withRegex(String regexString) {
    // Throws exceptions if regexString is not correct.
    return RegExInputFormatter._(RegExp(regexString));
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldVal, TextEditingValue newVal) {
    final oldValueValid = _isValid(oldVal.text);
    final newValueValid = _isValid(newVal.text);
    if (oldValueValid && !newValueValid) return oldVal;

    return newVal;
  }

  bool _isValid(String value) {
    try {
      final matches = _regExp.allMatches(value);
      for (Match match in matches)
        if (match.start == 0 && match.end == value.length)
          return true;

      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}
