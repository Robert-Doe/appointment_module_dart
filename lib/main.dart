import 'dart:core';

import 'package:appointment_assignment/date_to_contrast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlapping_time/overlapping_time.dart';

import 'old_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: CheckCrashes(),
    );
  }
}


class CheckCrashes extends StatefulWidget {
  const CheckCrashes({Key? key}) : super(key: key);

  @override
  _CheckCrashesState createState() => _CheckCrashesState();
}

class _CheckCrashesState extends State<CheckCrashes> {
  List<Map<String,dynamic>> appointments=[{
    "barber_id" :"",
    "client_id": "0207814656",
    "comment": "",
    "date": DateTime(2020, 1, 1, 1, 0),
    "duration" : 60,
    "shop_name" :"Premium cuts",
    "rate" : 0,
    "service_status": "PENDING",
    "shop_id":"0245382714"
  },
    {
      "barber_id" :"",
      "client_id": "0207814656",
      "comment": "",
      "date": DateTime(2020, 1, 1, 2, 29),
      "duration" : 60,
      "shop_name" :"Premium cuts",
      "rate" : 0,
      "service_status": "PENDING",
      "shop_id":"0245382714"
    },
    {
      "barber_id" :"",
      "client_id": "0207814656",
      "comment": "",
      "date": DateTime(2020, 1, 1, 2, 29),
      "duration" : 60,
      "shop_name" :"Premium cuts",
      "rate" : 0,
      "service_status": "PENDING",
      "shop_id":"0245382714"
    },{
      "barber_id" :"",
      "client_id": "0207814656",
      "comment": "",
      "date": DateTime(2020, 1, 1, 2, 29),
      "duration" : 60,
      "shop_name" :"Premium cuts",
      "rate" : 0,
      "service_status": "PENDING",
      "shop_id":"0245382714"
    },
  ];
  
  
  @override
  Widget build(BuildContext context) {
    final DateTimeRange rangeA = DateTimeRange(
      start: DateTime(2020, 1, 1, 1, 0),
      end: DateTime(2020, 1, 1, 2, 30),
    );
    // 2020-1-1 02:00 - 2020-1-1 05:00
    final DateTimeRange rangeB = DateTimeRange(
      start: DateTime(2020, 1, 1, 2, 34),
      end: DateTime(2020, 1, 1, 5, 0),
    );

    return Scaffold(
      body: ListView.builder(itemBuilder: (ctx,index){
        return  DualDateWidget( reference: getDTRange(appointments[index]),secondRef: rangeB,);
      },itemCount: appointments.length,),
    );
  }
  
  DateTimeRange getDTRange(Map<String,dynamic> appointment){
    DateTime start=appointment['date'];
    return DateTimeRange(start: appointment['date'], end: start.add(Duration(minutes:appointment['duration'])));
  }
  
  
  
  
}






