import 'dart:math';

import 'package:flutter/material.dart';

class FilterData with ChangeNotifier {
  int startPriceRange = 0;
  int endPriceRange = 0;

  String destination;

  void setPrice(int start, int end) {
    startPriceRange = start;
    endPriceRange = end;
    notifyListeners();
  }

  void setDestination(String incoDestination) {
    destination = incoDestination;
    notifyListeners();
  }

  void clearData() {
    startPriceRange = 0;
    endPriceRange = 0;
    destination = null;
  }
}

class InitialSetPrice with ChangeNotifier {
  int iniStart = 0;
  int iniEnd = 0;
  void setInitialPrice(int start, int end) {
    iniEnd = end;
    iniStart = start;
  }
}
