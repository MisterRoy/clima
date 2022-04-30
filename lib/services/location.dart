import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      //  print(position);
    } catch (e) {
      print('Error: ${e}');
    }
  }
}
