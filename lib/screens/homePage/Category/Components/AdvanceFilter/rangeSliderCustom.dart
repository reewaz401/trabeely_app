import 'package:flutter/material.dart';

class RangeSliderCustom extends StatefulWidget {
  @override
  _RangeSliderCustomState createState() => _RangeSliderCustomState();
}

class _RangeSliderCustomState extends State<RangeSliderCustom> {
  var selectedRange = RangeValues(2000, 15000);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: selectedRange,
          onChanged: (RangeValues newRange) {
            setState(() {
              selectedRange = newRange;
            });
          },
          min: 0,
          max: 50000,
          divisions: 10,
          activeColor: Colors.orange,
          labels: RangeLabels(selectedRange.start.round().toString(),
              selectedRange.end.round().toString()),
        ),
        Text(selectedRange.start.round().toString() +
            '-' +
            selectedRange.end.round().toString())
      ],
    );
  }
}
