import 'package:flutter/material.dart';

class DateProvider with ChangeNotifier {
  /// Which holds the selected date
  /// Defaults to today's date.
  DateTime selectedDate = DateTime.now();

  String selectdata = DateTime.now().toString().split(' ')[0];

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectdata = "${selectedDate.toLocal()}".split(' ')[0];
      print(selectdata);
      notifyListeners();
    }
  }
}
