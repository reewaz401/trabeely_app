import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DatePickerWidget extends StatefulWidget {
  final type;
  DatePickerWidget([this.type]);
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      cursorColor: Colors.grey,
      type: DateTimePickerType.date,
      dateMask: 'yyyy, MMM d',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      icon: Icon(
        Icons.event,
        color: Colors.green,
      ),
      dateLabelText: widget.type == 'from'
          ? 'From'
          : widget.type == 'to'
              ? 'To'
              : 'Date',
    );
  }
}
