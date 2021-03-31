import 'package:json_annotation/json_annotation.dart';
part 'booking.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Booking {
  Booking(
      {String type, String agentId, String packageId, int adult, int child});

  String type;
  String agentId;
  String packageId;
  String bookDate;
  int child;
  int adult;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
