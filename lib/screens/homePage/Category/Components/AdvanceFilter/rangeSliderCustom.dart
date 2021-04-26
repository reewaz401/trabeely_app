import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/FilterData.dart';
import 'package:provider/provider.dart';

class RangeSliderCustom extends StatefulWidget {
  @override
  _RangeSliderCustomState createState() => _RangeSliderCustomState();
}

class _RangeSliderCustomState extends State<RangeSliderCustom> {
  List<int> priceRange = [];
  var _isInitial = true;
  var selectedRange;
  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<FilterData>(context);
    var provider = Provider.of<InitialSetPrice>(context);
    if (_isInitial) {
      selectedRange = providerData.selectedPriceRange;
    }

    return Column(
      children: [
        RangeSlider(
          values: selectedRange,
          onChanged: (RangeValues newRange) {
            setState(() {
              selectedRange = newRange;
              provider.setInitialPrice(selectedRange.start.round().toDouble(),
                  selectedRange.end.round().toDouble());
              _isInitial = false;
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
