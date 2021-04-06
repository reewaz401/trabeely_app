part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return Booking(
      type: json['type'] as String,
      agentId: json['agentId'] as String,
      packageId: json['packageId'] as String,
      child: json['child'] as int,
      adult: json['adult'] as int);
}

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'type': instance.type,
      'child': instance.child,
      'adult': instance.adult,
      'packageId': instance.packageId,
    };
