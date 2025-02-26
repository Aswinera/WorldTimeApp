import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'zone?timeZone=Europe%2FLondon', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'zone?timeZone=Europe%2FBerlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'zone?timeZone=Africa%2FCairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'zone?timeZone=Africa%2FNairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'zone?timeZone=America%2FChicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'zone?timeZone=America%2FNew_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'zone?timeZone=Asia%2FSeoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'zone?timeZone=Asia%2FJakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'zone?timeZone=Europe%2FAmsterdam', location: 'Amsterdam', flag: 'Amsterdam.png'),
  ];

  void updateTime(index) async{
    WorldTime instance =locations[index];
    await instance.getTime();
    //navigate to Home screen
    Navigator.pop(context,
    {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

  }
 
  @override
 
  Widget build(BuildContext context) {
      
    return  Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
           ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
               child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
               ),
            ),
          );
        } ,

      )
    );
  }
}