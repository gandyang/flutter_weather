import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/retry.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class weatherScreen extends StatefulWidget {
  weatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<weatherScreen> createState() => _weatherScreenState();
}

class _weatherScreenState extends State<weatherScreen> {
  String cityName = '';
  int temp = 0;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upDate(widget.parseWeatherData);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            //상단왼
            leading: IconButton(
              icon: Icon(Icons.near_me),
              onPressed: () {},
              iconSize: 30.0,
            ),
            //상단오
            actions: [
              IconButton(
                icon: Icon(Icons.location_searching),
                onPressed: () {},
                iconSize: 30.0,
              ),
            ]),
        body: Container(
          child: Stack(
            children: [
              Image.asset('images/background.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150.0,
                              ),
                              Text(
                                'Deajeon',
                                style: GoogleFonts.lato(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  TimerBuilder.periodic(Duration(minutes: 1),
                                      builder: (context) {
                                    print('${getSystemTime()}');
                                    return Text(
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white),
                                    );
                                  }),
                                  Text(
                                    DateFormat(' - EEEE. ').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                  Text(
                                    DateFormat('d MMM, yyy').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${temp}ºC',
                                style: GoogleFonts.lato(
                                    fontSize: 85.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset('svg/climacon-sun.svg'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Clear sky',
                                    style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Divider(
                                height: 15.0,
                                thickness: 2.0,
                                color: Colors.white30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'AQI(대기질지수)',
                                        style: GoogleFonts.lato(
                                            fontSize: 14.0,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Image.asset(
                                        'images/bad.png',
                                        width: 37.0,
                                        height: 35.0,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '"매우나쁨"',
                                        style: GoogleFonts.lato(
                                            fontSize: 14.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'AQI(대기질지수)',
                                        style: GoogleFonts.lato(
                                            fontSize: 14.0,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Image.asset(
                                        'images/bad.png',
                                        width: 37.0,
                                        height: 35.0,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '"매우나쁨"',
                                        style: GoogleFonts.lato(
                                            fontSize: 14.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'AQI(대기질지수)',
                                        style: GoogleFonts.lato(
                                            fontSize: 14.0,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Image.asset(
                                        'images/bad.png',
                                        width: 37.0,
                                        height: 35.0,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '"매우나쁨"',
                                        style: GoogleFonts.lato(
                                            fontSize: 14.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ))
                    ]),
              )
            ],
          ),
        ));
  }
}
