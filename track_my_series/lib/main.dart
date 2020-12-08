// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Track My Series',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Track My Series'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),

        body: Center(
          child: Container(
            height: 200.0,
            width: 200.0,
            child: Text(
              'Qiktech in the house',
              style: TextStyle(
                fontFamily: 'poppins',
                color: Color(0xff534E91),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffDBFFD1),
            ),
            // padding: EdgeInsets.all(50),
          ),
        ),

        // ignore: missing_required_param
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          // child: Text('add'),
          child: Icon(
            Icons.add,
            color: Color(0xff534E91),
          ),
          backgroundColor: Color(0xffffffff),
        ),
      ),
    );
  }
}
