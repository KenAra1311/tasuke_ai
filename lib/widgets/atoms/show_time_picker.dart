import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowTimePicker {
  final BuildContext _context;
  final String _time;

  ShowTimePicker({
    @required BuildContext context,
    @required String time,
  })  : _context = context,
        _time = time;

  Future<String> selectTime() async {
    final TimeOfDay _selectedTime = await showTimePicker(
      context: _context,
      initialTime: TimeOfDay.now(),
    );

    if (_selectedTime != null) {
      return DateFormat.Hm('ja').format(_toDateTime(time: _selectedTime));
    } else {
      return _time;
    }
  }

  DateTime _toDateTime({@required TimeOfDay time}) {
    final _now = DateTime.now();

    return DateTime(_now.year, _now.month, _now.day, time.hour, time.minute);
  }
}
