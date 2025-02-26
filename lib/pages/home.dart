import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
  data=data.isNotEmpty ? data :  ModalRoute.of(context)!.settings.arguments as Map;
   print(data);
   
   //set backround
   String bgImage=data['isDaytime'] ? 'day.png' : 'night.png';
   Color bgColor= data['isDaytime'] ? Colors.blue : Colors.indigo;
    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit:BoxFit.cover, )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () async{
                   dynamic result= await Navigator.pushNamed(context, '/choose_location');
                   setState(() {
                     data={
                      'time':result['time'],
                      'location':result['location'],
                      'isDaytime':result['isDaytime'],
                      'flag':result['flag']
                     };
                   });
                  }, 
                  icon: Icon(Icons.edit_location,
                  color:Colors.black38,
                  ),
                  label: Text('edit location',
                  style: TextStyle(
                    color:Colors.black54,
                  ),),
                   ),
                   SizedBox(height: 30,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
                      )
                    ],
                   ),
                   SizedBox(height: 30,),
                   Text(data['time'],
                   style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                   ),
                   ),
              ],
            ),
          ),
        ) ,),
   );
  }
}