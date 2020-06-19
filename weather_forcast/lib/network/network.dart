import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/util/forecast_util.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
        "&appid="+Util.appId+"&units=imperial"; //change to metric or imperial

    Response response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if(response.statusCode == 200){
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error getting weather forecast");
    }

  }
}