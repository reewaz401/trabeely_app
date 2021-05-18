import 'package:flutter/widgets.dart';
import 'package:travel/services/deviceSize.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double kSafeAreaHorizental;
  static double kSpaceButton;
  static double kwTextField;
  static double khTextField;
  static double kwbutton;
  static double khbutton;
  static double kspaceTextField;
  static double kwAdvertise;
  static double khAdvertise;
  static double khDeals;
  static double kwDeals;
  static double khspace;
  static double khcommentButton;
  static double khstoryImage;
  static double khextendedAppBar;
  static double khcollapsedAppBar;
  static double khResult;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    kSafeAreaHorizental = 0.05 * screenWidth;
    kwbutton = 0.7 * screenWidth;
    khbutton = 0.065 * screenHeight;
    kSpaceButton = 0.0105 * screenHeight;
    kwTextField = 0.8 * screenWidth;
    khTextField = 0.065 * screenHeight;
    khDeals = 0.20 * screenHeight;
    kwDeals = 0.46 * screenWidth;
    khAdvertise = 0.25 * screenHeight;
    kwAdvertise = 0.9 * screenWidth;
    khspace = 0.013 * screenHeight;
    khcommentButton = 0.030 * screenHeight;
    khstoryImage = 0.4 * screenHeight;
    khextendedAppBar = 0.45 * screenHeight;
    khResult = 0.29 * screenHeight;
  }
}
