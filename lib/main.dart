import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/core/constrains.dart';
import 'package:note_app/widgets/add_weather_info.dart';
import 'package:note_app/widgets/geolocation.dart';
import 'package:note_app/widgets/weatherdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff081b25),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  ScreenHome());
  }
}

var dayinfo=DateTime.now();
  var dateformat=DateFormat('EEEE, d MMM, yyyy').format(dayinfo);

class ScreenHome extends StatelessWidget {
  var client= WeatherData();
  var data;
  


  info()async{
//  var position= await Getposition();
 data=await client.getData(11.25, 75.77);
 return data; 
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:FutureBuilder(
        future: info(),
        builder: (context, snapshot) => Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            padding: EdgeInsets.only(top: 30),
            height: size.height * 0.75,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                    colors: [kcolor1, kcolor2],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.4, 0.85])),
            child: Column(
              children: [
                Text(
                  "${data?.cityName}",
                  style: TextStyle(
                      fontSize: 30, color: Colors.white.withOpacity(0.9)),
                ),
                Text(
                  dateformat,
                  style: TextStyle(
                      fontSize: 15, color: Colors.white.withOpacity(0.9)),
                ),
                kheight,
                // Image.asset(
                //   "assets/pngwing.com.png",
                //   height: size.width * 0.4,
                // ),
                Image.network('https:${data?.icon}',width: size.width*0.3,fit: BoxFit.fill,),
                kheight,
                 Text(
                  "${data?.contition}",
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                 Text(
                  "${data?.temp}°",
                  style: const TextStyle(
                      fontSize: 65,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    AddWeatherInfo(size: size,weatherimage: "assets/pngwing.com (1).png",amount: "${data?.wind} km/h",weather: "Wind"),
                    khwidth,
                  AddWeatherInfo(size: size,weatherimage: "assets/Humiditywing.com (2).png",amount: "${data?.humidity}",weather: "Humidity",),
                  khwidth,
                  AddWeatherInfo(size: size,weatherimage: "assets/pngwing.com (2).png",amount: "${data?.wind_dir}",weather: "Wind direction"),

                  

                    ],
                  ),
                )
            
              ],
            ),
          ),
       kheigh2t,
          Row(
            children: [
              
    Expanded(
      child: Column(
        children: [
          Text(
            "Guest",
            style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
            )),
              Text(
            "${data?.gust} kp/h",
            style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            )),
           kheigh2t,
                Text(
            "Pressure",
            style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
            )),
              Text(
            "${data?.pressure} hpa ",
            style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            ))
        ],
      ),
    )
          ,  Expanded(
      child: Column(
        children: [
          Text(
            "UV",
            style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
            )),
              Text(
            "${data?.uv}",
            style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            )),
           kheigh2t,
                Text(
            "Precipitation",
            style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
            )),
              Text(
            "${data?.pricipe} mm",
            style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            ))
        ],
      ),
    )
           , Expanded(
      child: Column(
        children: [
          Text(
            "wind",
            style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
            )),
              Text(
            "${data?.wind} km/h",
            style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            )),
           kheigh2t,
                Text(
            "Last update",
            style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
            )),
              Text(
            "${data?.last_update} mm",
            style: TextStyle(
            fontSize: 11,
            color: Color.fromARGB(255, 69, 135, 71),
            ))
        ],
      ),
    )
           
            ],
          )
        ],
      ), )
    );
  }
}

