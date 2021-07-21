import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:track_my_series/screens/landing.dart';
import 'package:track_my_series/services/constants.dart';

void main() => runApp(ActivityScreen());

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}
// DBFFD1
// FFF4D1

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen()
    );
  }
}
