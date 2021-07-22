import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:track_my_series/screens/landing.dart';
import 'package:track_my_series/services/constants.dart';

class SeriesCard extends StatefulWidget {
  // const SeriesCard({Key key}) : super(key: key);

  final int index;

  const SeriesCard({Key key, @required this.index}) : super(key: key);

  @override
  _SeriesCardState createState() => _SeriesCardState(index: this.index);
}

class _SeriesCardState extends State<SeriesCard> {
  double height;
  int index;

  _SeriesCardState({@required this.index});

  @override
  void initState() {
    super.initState();
    height = size.height * 0.2;
  }

  @override
  Widget build(BuildContext context) {
    // print(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (height == size.height * 0.2) {
            height = size.height * 0.3;
          } else {
            height = size.height * 0.2;
          }
        });
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 35, 28),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 350),
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: index.isEven ? bgColor1 : bgColor2,
              ),
            ),
          ),
          Positioned(
            right: 17.5,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 350),
              height: height,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: index.isEven ? bgColor1 : bgColor2,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

            ),
          ),

        ],
      ),
    );
  }
}
// DBFFD1
// FFF4D1
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Color(0xffDBFFD1),
// ),


// class SeriesCard extends StatefulWidget {
//   @override
//   _SeriesCardState createState() => _SeriesCardState();
// }
//
// class _SeriesCardState extends State<SeriesCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         decoration: BoxDecoration(
//           color: Color(0xff000000),
//         ),
//
//         child:
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             child: Container(
//               decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Color(0xffDBFFD1),
//             ),
//             child: ExpansionCard(
//                 backgroundColor: Color(0xFFDBFFD1),
//                 borderRadius: 20,
//                 trailing: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   child: Icon(
//                     Icons.edit,
//                     color: Colors.black,
//                   ),
//                 ),
//                 title: Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Header",
//                         // style: TextStyle(color: Colors.black),
//                       ),
//                       Text("Sub"),
//                     ],
//                   ),
//                 ),
//                 children: <Widget>[
//                   Card(
//                     margin: EdgeInsets.symmetric(horizontal: 7),
//                     child: Text(
//                       "Content goes over here !",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         // ],
//       ),
//     );
//   }
// }
