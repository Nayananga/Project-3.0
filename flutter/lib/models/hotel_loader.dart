import 'package:project_3s_mobile/models/entities/hotel.dart';

class HotelLoader {
  List _hotels;

  HotelLoader(this._hotels);

  List<Hotel> load() {
    final _hotelList = (_hotels)
        .map<Hotel>(
            (dynamic json) => Hotel.fromJson(json as Map<String, dynamic>))
        .toList();
    print(_hotelList);
    return _hotelList;
  }
}
