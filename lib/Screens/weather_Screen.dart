import 'package:flutter/material.dart';

class weatherScreen extends StatefulWidget {
  weatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<weatherScreen> createState() => _weatherScreenState();
}

class _weatherScreenState extends State<weatherScreen> {
  String cityName = '';
  int temp = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upDate(widget.parseWeatherData);
  }

  void upDate(dynamic weatherData) {
    cityName = weatherData['name'];
    double temp2 = 0;
    temp2 = weatherData['main']['temp'];
    temp = temp2.round();

    print(cityName);
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '$cityName',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '$temp',
              style: TextStyle(fontSize: 30.0),
            ),
          ]),
        ),
      ),
    );
  }
}
