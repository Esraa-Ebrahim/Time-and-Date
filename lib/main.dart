//import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState()=> _MyAppState();
}
class _MyAppState extends State<MyApp>{
  var _todoDateController = TextEditingController();
   @override
   Widget build(BuildContext context) {
     return new SplashScreen (
       seconds: 10,
       backgroundColor: Colors.black,
       image: Image.asset('IMAGES/logopng.png'),
       loaderColor: Colors.deepOrangeAccent,
       photoSize: 100,
       navigateAfterSeconds: MainScreen(),
     );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime dateTime = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Future select_date (BuildContext context)async{
    DateTime date_picker = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1950),
      lastDate: DateTime(2022),
    );
    if(date_picker!=null && date_picker != dateTime){
      setState(() {
        dateTime= date_picker;
      });
    }

  }

  Future select_time()async{
    var time2 = await showTimePicker(context: context,
        initialTime: time,

    ).then((value) {
      setState(() {
        time = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('* Home Screen *',
          style: TextStyle( fontSize: 20,
            fontWeight: FontWeight.bold,

          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          height: 200,
          child: Column(
            children: [
              Text('$time',style: TextStyle(fontSize: 25,color: Colors.black,
                  fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Text('$dateTime',style: TextStyle(fontSize: 25,color: Colors.black,
                  fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 100,
                height: 35,
                child: ElevatedButton(onPressed: (){
                  select_date(context);
                  select_time();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Column(
                        children: [
                          Text('$time',),
                          Text('$dateTime',),

                        ],
                      ),
                          duration: Duration(seconds: 15),

                      )
                  );

                }, child:Text('test'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,

                  ),
                ),
              ),
            ],
          ),
        )
      ),

    );

  }
}


