import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

     String location; //location name for the UI
     String time='';//the time in that location
     String flag; //url to an asset flag icon
     String url; //location url for api endpoint
     late bool isDaytime; //true or false if daytime or not

 WorldTime({required this.location,required this.flag,required this.url,});

    Future<void> getTime() async{
   
   try{
    Response response= await get(Uri.parse('https://timeapi.io/api/time/current/$url'));
    Map data= jsonDecode(response.body);
   

    //get properties from data
    String datetime= data['dateTime'];
  

    //create the datetime object
    //to convert the object
    DateTime  now=DateTime.parse(datetime);
    
    //set the time property
    isDaytime= now.hour > 6 && now.hour < 20 ? true : false;
    time=DateFormat.jm().format(now);

   }
   catch(e){
    print('caught error:$e');
    time='could not get time data';
   }
    //make the request
    
}


}

