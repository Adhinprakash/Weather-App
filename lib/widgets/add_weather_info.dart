import 'package:flutter/material.dart';

class AddWeatherInfo extends StatelessWidget {
  
  const AddWeatherInfo({
    super.key,
    required this.size,
    required this.weatherimage,
    required this.amount,
    required this.weather,
  
    
  });

  final Size size;
  final  weatherimage;
  final  String  amount;
  final String weather;


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Image.asset(
          weatherimage,
          height:29 ,
        ),
        
   
    Text(
      amount,
      style: const TextStyle(
      fontSize: 15,
      color: Colors.white,
      )
    ),
    Text(
      weather,
      style: TextStyle(
      fontSize: 15,
      color: Colors.white.withOpacity(0.9,
      ),
      
          ),
          maxLines: 2,
          )
    
    
      ],
    );
  }
}
