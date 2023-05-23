import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:note_app/widgets/weathermode.dart';

class WeatherData{

  Future<weather>getData(var latitude, var longitude)async{
    var uricall=Uri.parse('http://api.weatherapi.com/v1/current.json?key=37afdaa91ff44125be193454232305&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uricall);
    var body=jsonDecode(response.body);
    return weather.fromjson(body);
    
  }
}