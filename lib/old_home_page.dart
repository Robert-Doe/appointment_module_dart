import 'package:appointment_assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:overlapping_time/overlapping_time.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
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
  ];

  String bookMessage="";
  @override
  Widget build(BuildContext context) {
    // 2020-1-1 01:00 - 2020-1-1 04:00
    final DateTimeRange rangeA = DateTimeRange(
      start: DateTime(2020, 1, 1, 1, 0),
      end: DateTime(2020, 1, 1, 2, 30),
    );
    // 2020-1-1 02:00 - 2020-1-1 05:00
    final DateTimeRange rangeB = DateTimeRange(
      start: DateTime(2020, 1, 1, 2, 29),
      end: DateTime(2020, 1, 1, 5, 0),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(rangeA.toString()),
          Text(rangeB.toString()),
          Text(bookMessage,style: TextStyle(fontWeight: FontWeight.bold
          ),),
          ElevatedButton(
            onPressed: () {

              List ranges = [rangeA, rangeB];

              final Map<int, List<ComparingResult>> searchResults = findOverlap(ranges: ranges);


              if(searchResults[2]!.isEmpty){
                setState(() {
                  bookMessage="Appointment Possible";
                });
                print('Appointment Possible');
              }else{
                setState(() {
                  bookMessage="Duration Occupied, Barber Booked";
                });
                print('Duration Occupied, Barber Booked');
              }



              //print(searchResults.runtimeType );
              //print(searchResults[2].runtimeType);
              // print(searchResults[2]!.first.overlappingRange);

              // Extract range that all 3 ranges overlap with each other
              //final DateTimeRange overlappingRange = searchResults[2]!.first.overlappingRange;
              // print(overlappingRange);
            },
            child: Text('Check Interval'),
          ),
        ],
      ),
    );
  }
}