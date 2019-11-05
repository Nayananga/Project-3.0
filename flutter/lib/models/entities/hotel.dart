import 'package:meta/meta.dart';

class Hotel {
  final int hotelId;
  final String hotelName, hotelAddress;

  Hotel({
    @required this.hotelId,
    @required this.hotelName,
    this.hotelAddress,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
        hotelId: json['id'] as int,
        hotelName: json['hotel_name'] as String,
        hotelAddress: json['address'] as String);
  }
}
