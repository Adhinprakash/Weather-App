// ignore: camel_case_types
import 'package:flutter/material.dart';

class weather {
  var cityName;
  var icon;
  var contition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;

  weather(
      {required this.cityName,
      required this.icon,
      required this.contition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.wind_dir,
      required this.pressure,
      required this.pricipe,
      required this.last_update,
       required this.gust,
       required this.uv,
      });
  weather.fromjson(Map<String,dynamic>json){
    cityName=json['location']['name'];
    icon=json['current']['condition']['icon'];
    contition=json['current']['condition']['text'];
    temp=json['current']['temp_c'];
    wind=json['current']['wind_kph'];
    humidity=json['current']['humidity'];
    wind_dir=json['current']['wind_dir'];
    pressure=json['current']['pressure_mb'];
    pricipe=json['current']['precip_mm'];
    last_update=json['current']['last_updated'];
    gust=json['current']['gust_kph'];
    uv=json['current']['uv'];
  }
}
