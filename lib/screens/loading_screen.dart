import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // Location location = new Location();
    // await location.getCurrentLocation();
    // longitude = location.longitude;
    // latitude = location.latitude;
    // // https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&cnt=7&appid=
    // NetworkHelper networkHelper = new NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&cnt=7&appid=$apiKey&units=metric');
    // var weatherData = await networkHelper.getData();
    WeatherModel wm = new WeatherModel();
    var weatherData = await wm.getLocationWeather();
    Navigator.push(context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
        // child: ElevatedButton(
        //   onPressed: () {
        //     getLocation();
        //     //Get the current location
        //   },
        //   child: Text('Get Location'),
        // ),
      ),
    );
  }
}
