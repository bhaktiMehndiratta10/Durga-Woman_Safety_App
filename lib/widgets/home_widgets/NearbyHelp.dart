import 'package:Durga/widgets/home_widgets/NearbyHelp/BusStopCard.dart';
import 'package:Durga/widgets/home_widgets/NearbyHelp/HospitalCard.dart';
import 'package:Durga/widgets/home_widgets/NearbyHelp/PoliceStationCard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyHelp extends StatelessWidget {
  const NearbyHelp({super.key});

  static Future<void> openMap(String location) async{
    String googleUrl='https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
  try{
    await launchUrl(_url);
  }
  catch(e)
  {
    Fluttertoast.showToast(msg: 'We are really sorry, something went wrong! Please call the emergency numbers, Stay Safe!');
  }
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adds margin
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10), // Adds space below heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Spaces items evenly
            children: [
              PoliceStationCard(onMapFunction: openMap),
              HospitalCard(onMapFunction: openMap),
              BusStopCard(onMapFunction: openMap),
            ],
          ),
        ],
      ),
    );
  }
}
