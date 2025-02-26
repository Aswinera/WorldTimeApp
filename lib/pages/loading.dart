import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 
  void setupWorldTime() async{
    WorldTime instance= WorldTime(location: 'Amsterdam',flag: 'Amsterdam.png',url: 'zone?timeZone=Europe%2FAmsterdam');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
   
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body:Text('loading'),
    );
  }
}