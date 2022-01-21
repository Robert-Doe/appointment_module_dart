import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overlapping_time/overlapping_time.dart';


class DualDateWidget extends StatefulWidget {
  final DateTimeRange reference;
  final DateTimeRange secondRef;

  const DualDateWidget({Key? key, required this.reference, required this.secondRef}) : super(key: key);
  @override
  _DualDateWidgetState createState() => _DualDateWidgetState();
}

class _DualDateWidgetState extends State<DualDateWidget> {

  String bookMessage="";
  Color textColor=Colors.black;
  @override
  Widget build(BuildContext context) {

    List ranges = [widget.reference, widget.secondRef];

    final Map<int, List<ComparingResult>> searchResults = findOverlap(ranges: ranges);

    if(searchResults[2]!.isEmpty){
      setState(() {
        bookMessage="Appointment Possible";
        textColor=Colors.black;
      });
      print('Appointment Possible');
    }else{
      setState(() {
        bookMessage="Duration Occupied, Barber Booked";
        textColor=Colors.red;
      });
      print('Duration Occupied, Barber Booked');
    }



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children:  [
            Text('Source',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text(DateFormat('yyyy MM dd hh:mm a').format(widget.reference.start),style: TextStyle(fontSize: 10,color: textColor),),
                Text(DateFormat('yyyy MM dd hh:mm a').format(widget.reference.end),style: TextStyle(fontSize: 10,color: textColor),),
              ],),
            Text('Contrast',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text(DateFormat('yyyy MM dd hh:mm a').format(widget.secondRef.start),style: TextStyle(fontSize: 10,color: textColor),),
                Text(DateFormat('yyyy MM dd hh:mm a').format(widget.secondRef.end),style: TextStyle(fontSize: 10,color: textColor),),
              ],),
          ],
        ),
      ),
    );
  }
}
