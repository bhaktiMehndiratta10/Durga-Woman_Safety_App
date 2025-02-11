import 'package:flutter/material.dart';

class BusStopCard extends StatelessWidget {
  final Function? onMapFunction;
  const BusStopCard({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensures minimal height
      crossAxisAlignment: CrossAxisAlignment.center, // Centers the text
      children: [
        InkWell(
          onTap: (){
            onMapFunction!('Bus Stops near me');
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: const Icon(Icons.directions_bus, size: 30, color: Colors.green),
            ),
          ),
        ),
        const SizedBox(height: 5), // Adds space between icon and text
        const Text(
          'Bus Stop',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500), // Adjusted font size
        ),
      ],
    );
  }
}
