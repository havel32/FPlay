import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/navigation.dart';

class PlayLists extends StatelessWidget {
  const PlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 1; i < 10; i++)
            Container(
              margin: const EdgeInsets.only(top: 20, right: 20, left: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color(0xFF30314d),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        // TODO: navigation to play list
                        // Navigate to the playlist screen
                        Navigator.of(context).pushNamed(
                          MainNavigationRoutesNames.playListPage,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/duaLipa.webp',
                            fit: BoxFit.cover, height: 60, width: 60),
                      )),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Future Nostalgia",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 5),
                      Text("12 songs",
                          style: TextStyle(
                            color: Colors.white.withAlpha(128),
                            fontSize: 14,
                          )),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        // TODO: play list more
                      },
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white.withAlpha(140),
                        size: 30,
                      ))
                ],
              ),
            )
        ],
      ),
    );
  }
}
