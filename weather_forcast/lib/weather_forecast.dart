import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/network/network.dart';

class WeatherForcast extends StatefulWidget {
  @override
  _WeatherForcastState createState() => _WeatherForcastState();
}

class _WeatherForcastState extends State<WeatherForcast> {
  Future<WeatherForecastModel> foreCastObject;
  String _citiName = "Beni-Mellal";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foreCastObject = Network().getWeatherForecast(cityName: _citiName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forcast"),
      ),
    );
  }
}
