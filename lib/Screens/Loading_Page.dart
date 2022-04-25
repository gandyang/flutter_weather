import 'package:flutter/material.dart';
import 'package:flutter_weather_api/Data/Network.dart';
import 'package:flutter_weather_api/Data/my_location.dart';
import 'package:flutter_weather_api/Screens/weather_Screen.dart';

const apikey = 'fd02d27698e9603b7718a2cdd2752a78';

class Loading_Page extends StatefulWidget {
  @override
  State<Loading_Page> createState() => _Loading_PageState();
}

class _Loading_PageState extends State<Loading_Page> {
  double latitude3 = 0;
  double longitude3 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return weatherScreen(
        parseWeatherData: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text('Get my location', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
