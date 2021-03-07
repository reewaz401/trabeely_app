import 'package:intl/intl.dart';

class HotelForm {
  final String hotelId;
  final String hotelName;
  final String location;
  final List<String> amenities;
  final List<String> roomFeatures;
  const HotelForm(
      {this.hotelId,
      this.hotelName,
      this.location,
      this.amenities,
      this.roomFeatures});
}
