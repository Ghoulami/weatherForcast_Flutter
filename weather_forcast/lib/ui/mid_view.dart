import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/util/convert_icons.dart';
import 'package:weather_forcast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formatedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${city}, ${country}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          Text(
            "${Util.getFormattedDate(formatedDate)}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather[0].description , size: 195, color:Colors.pinkAccent),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${toCelsius(forecastList[0].temp.day).toStringAsFixed(1)}°C  ",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                Text(
                  "${forecastList[0].weather[0].description.toUpperCase()}",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].speed.toStringAsFixed(1)}  mi/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].humidity.toStringAsFixed(0)}  %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${toCelsius(forecastList[0].temp.max).toStringAsFixed(1)} °C"),
                      Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown)
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

double toCelsius(double temp) {
  return ((temp - 32) * 5) / 9;
}
