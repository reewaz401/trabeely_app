import 'package:flutter/material.dart';

class ToursForm {
  final String pacakageType;
  final String packageTitle;
  final String meetingPoint;
  final List<String> packageImages;
  final String agencyName;
  final String destination;
  final double price;
  final String duration;
  final String dateTime;
  final Map<String, String> itinerary;
  final Map<String, String> hotelDetails;
  final List<String> includes;
  final List<String> cancelPolicies;
  const ToursForm(
      {this.pacakageType,
      this.packageTitle,
      this.meetingPoint,
      this.packageImages,
      this.agencyName,
      this.destination,
      this.price,
      this.duration,
      this.dateTime,
      this.itinerary,
      this.hotelDetails,
      this.includes,
      this.cancelPolicies});
}
