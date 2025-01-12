import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/duaLipa.webp",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withAlpha(88),
                  Colors.black.withAlpha(128),
                  Color(0xFF13114F).withAlpha(200),
                  Color(0xFF13114F).withAlpha(245),
                  Color(0xFF13114F).withAlpha(255),
                  Color(0xFF13114F).withAlpha(255),
                ])),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 45, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(CupertinoIcons.back,
                              color: Colors.white, size: 30),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.more_vert,
                              color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Column(children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 23, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Song Title',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withAlpha(240),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Dua Lipa',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white.withAlpha(210),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Column(
                        children: [
                          Slider(
                            min: 0,
                            max: 100,
                            value: 40,
                            onChanged: (value) {},
                            activeColor: Colors.white,
                            inactiveColor: Colors.white54,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '00:40',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withAlpha(150),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '03:20',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withAlpha(150),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 32,
                            ),
                            const Icon(
                              CupertinoIcons.backward_end_fill,
                              color: Colors.white,
                              size: 30,
                            ),
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(
                                Icons.play_arrow,
                                color: Color(0xFF31314F),
                                size: 40,
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.forward_end_fill,
                              color: Colors.white,
                              size: 30,
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                              size: 35,
                            )
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
