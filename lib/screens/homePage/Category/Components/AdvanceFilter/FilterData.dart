import 'dart:math';

import 'package:flutter/material.dart';

class FilterData with ChangeNotifier {
  RangeValues selectedPriceRange = RangeValues(0, 5000);
  String destination;

  void setPrice(double start, double end) {
    selectedPriceRange = RangeValues(start, end);
    notifyListeners();
  }

  void setDestination(String incoDestination) {
    destination = incoDestination;
    notifyListeners();
  }

  void clearData() {
    selectedPriceRange = RangeValues(0, 0);
    destination = null;
  }
}

class InitialSetPrice with ChangeNotifier {
  double iniStart = 0;
  double iniEnd = 5000;
  void setInitialPrice(double start, double end) {
    iniEnd = end;
    iniStart = start;
  }
}
