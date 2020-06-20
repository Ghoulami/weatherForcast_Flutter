import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formatedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
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
          )
        ],
      ),
    ),
  );
}
