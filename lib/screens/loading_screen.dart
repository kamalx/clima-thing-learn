import 'package:Clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:Clima/services/location.dart';
import 'package:Clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'f236d9844fdca387e028e2f84632550e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat, lon;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // using geolocator
    Location location = Location();
    await location.getCurrentLocation();

    lat = location.latitude;
    lon = location.longitude;

    String url = 'https://api.openweathermap.org/data/2.5/weather?' +
        'lat=$lat&lon=$lon&appid=$apiKey';

    // using http et al
    NetworkHelper nh = NetworkHelper(url);

    var weatherData = await nh.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
