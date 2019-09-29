import 'package:location/location.dart';

class GeoLocation {

  Future<LocationData> getGeoLocation() async {
    LocationData _currentLocation;
    var _location = new Location();
    try {
      _currentLocation = await _location.getLocation();
      return _currentLocation;
    } catch (e) {
      print("error getting location");
      return _currentLocation;
    }
  }

  Future<Map<String, dynamic>> locationToJson() async{
    LocationData _location = await getGeoLocation();
    Map<String, dynamic> _jsonLocation =
    {
      'longitude': _location.longitude,
      'latitude': _location.latitude,
    };
    return _jsonLocation;
  }
}
