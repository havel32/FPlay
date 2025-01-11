import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                              children: [Text('Play ALL')],
                            ),
                          ),
                        )
                      ])
                ],
              ),
            ),
          )),
    );
  }
}
