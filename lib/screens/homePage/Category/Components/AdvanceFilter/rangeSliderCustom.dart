import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/FilterData.dart';
import 'package:provider/provider.dart';

class RangeSliderCustom extends StatefulWidget {
  @override
  _RangeSliderCustomState createState() => _RangeSliderCustomState();
}

class _RangeSliderCustomState extends State<RangeSliderCustom> {
  var selectedRange = RangeValues(2000, 15000);
  List<int> priceRange = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<InitialSetPrice>(context);

    return Column(
      children: [
        RangeSlider(
          values: selectedRange,
          onChanged: (RangeValues newRange) {
            setState(() {
              selectedRange = newRange;
              provider.setInitialPrice(
                  selectedRange.start.round(), selectedRange.end.round());
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
