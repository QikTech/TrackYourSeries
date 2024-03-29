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
  int seriesIndex = 0;

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
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Row(
                          children: [
                            Image.asset('assets/Friends.png'),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Breaking Bad',
                                  style: new TextStyle(
                                    fontSize: 22.0,
                                    color: accentPurple,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                          Icons.remove,
                                          size: 30,
                                          color: accentPurple,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            seriesIndex -= 1;
                                          });
                                        }),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('E$seriesIndex'),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                    ),
                                    IconButton(
                                        focusColor: Colors.green,
                                        icon: Icon(
                                          Icons.add,
                                          size: 30,
                                          color: accentPurple,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            seriesIndex += 1;
                                          });
                                        }),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      CircleAvatar(
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
                    ],
                  )))
        ],
      ),
    );
  }
}
