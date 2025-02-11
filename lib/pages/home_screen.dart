import 'dart:async';
import 'dart:math';
import 'package:Durga/widgets/home_widgets/NearbyHelp.dart';
import 'package:Durga/widgets/home_widgets/CustomCarousel.dart';
import 'package:Durga/widgets/home_widgets/custom_appbar.dart';
import 'package:Durga/widgets/home_widgets/emergency.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qIndex = 0;
  late Timer _quoteTimer;

  void getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(5);
    });
  }

  @override
  void initState() {
    super.initState();
    getRandomQuote();
    _quoteTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      getRandomQuote();
    });
  }

  @override
  void dispose() {
    _quoteTimer.cancel(); // Cancel timer when screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // 1. Quotes (Auto-changing every 3 seconds)
              CustomAppBar(
                quoteIndex: qIndex,
                onTap: () {
                  getRandomQuote();
                },
              ),

              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomCarousel(),
                    SizedBox(height: 30),

                    // Nearby Help Section
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Nearby Help",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    NearbyHelp(),

                    SizedBox(height: 28), // Added spacing

                    // Emergency Contacts Section
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Emergency contacts",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Emergency(),

                    SizedBox(height: 15), // Increased spacing before "Stay Safe"

                    // "Stay Safe" Text
                    Center(
                      child: Text(
                        "Stay Safe",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                    ),

                    SizedBox(height: 10), // Space between "Stay Safe" and Logout

                    // Logout button (Now properly spaced from the bottom)
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.logout, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                "Log Out",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20), // Extra spacing at the bottom
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
