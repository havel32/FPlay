import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/navigation.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          for (int i = 1; i < 20; i++)
            Container(
              margin: EdgeInsets.only(top: 15, left: 5, right: 12),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      Navigator.of(context)
                          .pushNamed(MainNavigationRoutesNames.musicPage);
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
    );
  }
}
