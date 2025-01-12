import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/navigation.dart';

class PlayListPage extends StatelessWidget {
  const PlayListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF303151).withAlpha(135),
            Color(0xFF303151).withAlpha(240)
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              CupertinoIcons.back,
                              color: Color(0xFF899CCF),
                              size: 30,
                            )),
                        InkWell(
                            onTap: () {
                              //TODO
                            },
                            child: Icon(
                              Icons.more_vert,
                              color: Color(0xFF899CCF),
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/duaLipa.webp',
                      width: 250,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Future Nostalgia',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white.withAlpha(245),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Dua Lipa',
                        style: TextStyle(
                          color: Colors.white.withAlpha(180),
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 170,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Play all',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF303140),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.play_arrow_rounded,
                                    size: 35, color: Color(0xFF30314D)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 170,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Shuffle',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF303140),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.shuffle,
                                    size: 25, color: Color(0xFF303140)),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(height: 20),
                  for (int i = 1; i < 20; i++)
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFF30314D),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            i.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              //TODO navigation to music page
                              Navigator.of(context).pushNamed(
                                  MainNavigationRoutesNames.musicPage);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Song Title',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Artist',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   "Bass",
                                    //   style: TextStyle(
                                    //     color: Colors.white.withAlpha(230),
                                    //     fontSize: 16,
                                    //   ),
                                    // ),
                                    // SizedBox(width: 5),
                                    // Text(
                                    //   "-",
                                    //   style: TextStyle(
                                    //     color: Colors.white.withAlpha(150),
                                    //     fontSize: 25,
                                    //   ),
                                    // ),
                                    // SizedBox(width: 5),
                                    Text(
                                      "4:30",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(150),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Color(0xFF31314F),
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
