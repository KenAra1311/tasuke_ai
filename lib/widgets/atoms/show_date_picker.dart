import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowDatePicker {
  final BuildContext _context;
  final String _date;

  ShowDatePicker({
    @required BuildContext context,
    @required String date,
  })  : _context = context,
        _date = date;

  Future<String> selectDate() async {
    final DateTime _selectedDate = await showDatePicker(
      context: _context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (_selectedDate != null) {
      return DateFormat.yMMMd('ja').format(_selectedDate);
    } else {
      return _date;
    }
  }
}
