import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/network/network.dart';
import 'package:weather_forcast/ui/bottom_view.dart';
import 'package:weather_forcast/ui/mid_view.dart';

class WeatherForcast extends StatefulWidget {
  @override
  _WeatherForcastState createState() => _WeatherForcastState();
}

class _WeatherForcastState extends State<WeatherForcast> {
  Future<WeatherForecastModel> foreCastObject;
  String _citiName = "Rabat";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foreCastObject = getWeather(_citiName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldViews(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: foreCastObject,
                builder: (BuildContext context,AsyncSnapshot<WeatherForecastModel> snapshot){
                  if(snapshot.hasData){
                    return Column(
                        children : [
                          midView(snapshot),
                          bottomView(snapshot:snapshot,  context:context)
                        ],
                    );
                  }else{
                    return Center(child:CircularProgressIndicator(),);
                  }
                },
            )
          )
        ],
      ),
    );
  }

  Widget textFieldViews() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Entre city name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value){
          setState(() {
            this._citiName = value;
            foreCastObject = getWeather(_citiName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather(String citiName) => Network().getWeatherForecast(cityName: _citiName);
}
