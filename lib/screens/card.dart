import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:track_my_series/screens/landing.dart';


class SeriesCard extends StatefulWidget {
  // const SeriesCard({Key key}) : super(key: key);



  @override
  _SeriesCardState createState() => _SeriesCardState();
}

class _SeriesCardState extends State<SeriesCard> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        setState(() {
          if(height==size.height*0.2){
            height = size.height*0.3;
          } else{
            height = size.height*0.2;
          }

        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        height: height,

        decoration: BoxDecoration(
          color: bgColor1,
        ),
      ),
    );

  }
}
