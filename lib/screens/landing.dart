import 'package:flutter/material.dart';
import 'package:track_my_series/services/constants.dart';

// DBFFD1
// FFF4D1

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  double height;
  // double height = size.height*0.2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      height = size.height*0.2;
    });
  }

  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Track My Series'),
      ),
      body: Column(children: [
      ]),
    );
  }
}
