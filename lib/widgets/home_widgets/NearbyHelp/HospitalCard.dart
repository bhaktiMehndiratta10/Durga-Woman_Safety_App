import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final Function? onMapFunction;
  const HospitalCard({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensures minimal height
      crossAxisAlignment: CrossAxisAlignment.center, // Centers the text
      children: [
        InkWell(
          onTap: (){
            onMapFunction!('Hospitals near me');
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
              child: const Icon(Icons.local_hospital, size: 30, color: Colors.orange),
            ),
          ),
        ),
        const SizedBox(height: 5), // Adds space between icon and text
        const Text(
          'Hospital',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500), // Adjusted font size
        ),
      ],
    );
  }
}
