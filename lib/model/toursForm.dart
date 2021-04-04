import 'package:flutter/material.dart';

class ToursForm {
  final String status;
  final List<String> packageImages;
  final List<String> includes;
  final String packageType;
  final String title;
  final double price;
  final String address;
  final String overview;
  final double minTraveller;
  final List<String> cancelPolicies;
  final Map<String, dynamic> groupDiscount;
  final String destination;
  final Map<String, String> itinerary;
  final String duration;

  const ToursForm(
      {this.status,
      this.packageImages,
      this.includes,
      this.packageType,
      this.title,
      this.price,
      this.address,
      this.overview,
      this.minTraveller,
      this.cancelPolicies,
      this.groupDiscount,
      this.destination,
      this.itinerary,
      this.duration});

  void add(ToursForm toursForm) {}
}
