import 'package:Durga/widgets/home_widgets/emergencies/ambulance.dart';
import 'package:Durga/widgets/home_widgets/emergencies/integrated.dart';
import 'package:Durga/widgets/home_widgets/emergencies/police.dart';
import 'package:Durga/widgets/home_widgets/emergencies/woman_helpline.dart';
import 'package:flutter/material.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  // List of emergency widgets
  List<Widget> emergencyWidgets = [
    Police(),
    Ambulance(),
    Integrated(),
    WomanHelpline(),
  ];

  // List of titles for search filtering
  List<String> emergencyTitles = [
    'Police',
    'Ambulance',
    'Integrated',
    'Woman Helpline',
  ];

  // List to store filtered emergency widgets
  List<Widget> filteredWidgets = [];

  // Search query variable
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredWidgets = emergencyWidgets; // Initially show all
  }

  // Function to filter widgets based on search query
  void filterSearchResults(String query) {
    List<Widget> tempList = [];
    for (int i = 0; i < emergencyTitles.length; i++) {
      if (emergencyTitles[i].toLowerCase().contains(query.toLowerCase())) {
        tempList.add(emergencyWidgets[i]);
      }
    }

    setState(() {
      filteredWidgets = tempList;
      this.query = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar to filter the list
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              filterSearchResults(value); // Filter list as user types
            },
            decoration: InputDecoration(
              labelText: 'Search Emergency',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        // ListView displaying filtered emergency widgets
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.67, // Set height to fit content
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: filteredWidgets,
          ),
        ),
      ],
    );
  }
}
