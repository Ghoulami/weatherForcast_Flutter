import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';

import 'forcastCard.dart';

Widget bottomView({AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context}){

  var forecastList = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7 Day weather Forcast".toUpperCase(),
      style: TextStyle(
        fontSize: 14,
        color : Colors.black87
      ),),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 10),
        child:ListView.separated(
          separatorBuilder: (context , index)=> SizedBox(width: 8,),
          itemCount: forecastList.length,
          itemBuilder: (context , index)=> ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width/2.7,
              height: 160,
              child: forcastCard(snapshot , index),
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff9661C3) , Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                ),

              ),
            ),
          ),
        ),
      ),
    ],
  );
}