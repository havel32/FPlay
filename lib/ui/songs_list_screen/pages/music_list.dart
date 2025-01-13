import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/model_home_screen.dart';
import 'package:flutter_application_1/ui/navigation.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  late Future<List<SongModel>> musicList;
  final screenModel = ModelHomeScreen();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    musicList = screenModel.getSongsList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<List<SongModel>>(
            future: musicList,
            builder: (context, item) {
              if (item.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Checking permission...',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white.withAlpha(128),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircularProgressIndicator(
                        color: Colors.white.withAlpha(128),
                      ),
                    ],
                  ),
                );
              } else if (item.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'Error: ${item.error}',
                        maxLines: 3,
                      )
                    ],
                  ),
                );
              } else if (item.hasData && item.data != null) {
                return ListView.builder(
                  itemCount: item.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MainNavigationRoutesNames.musicPage);
                      },
                      title: Text(item.data![index].title),
                    );
                  },
                );
              } else {
                return const SizedBox(
                  child: Text('No data found',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                );
              }
            }
            // child: Column(
            //   children: [
            //     const SizedBox(height: 15),
            //     for (int i = 1; i < 20; i++)
            //       Container(
            //         margin: const EdgeInsets.only(top: 15, left: 5, right: 12),
            //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //         decoration: BoxDecoration(
            //             color: const Color(0xFF30314D),
            //             borderRadius: BorderRadius.circular(15)),
            //         child: Row(
            //           children: [
            //             Text(
            //               i.toString(),
            //               style: const TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w400,
            //               ),
            //             ),
            //             const SizedBox(width: 25),
            //             InkWell(
            //               onTap: () {
            //                 Navigator.of(context)
            //                     .pushNamed(MainNavigationRoutesNames.musicPage);
            //               },
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   const Text(
            //                     'Song Title',
            //                     style: TextStyle(
            //                       fontSize: 17,
            //                       fontWeight: FontWeight.w500,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   const SizedBox(height: 5),
            //                   const Text(
            //                     'Artist',
            //                     style: TextStyle(
            //                       fontSize: 17,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   const SizedBox(height: 2),
            //                   Row(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       // Text(
            //                       //   "Bass",
            //                       //   style: TextStyle(
            //                       //     color: Colors.white.withAlpha(230),
            //                       //     fontSize: 16,
            //                       //   ),
            //                       // ),
            //                       // SizedBox(width: 5),
            //                       // Text(
            //                       //   "-",
            //                       //   style: TextStyle(
            //                       //     color: Colors.white.withAlpha(150),
            //                       //     fontSize: 25,
            //                       //   ),
            //                       // ),
            //                       // SizedBox(width: 5),
            //                       Text(
            //                         "4:30",
            //                         style: TextStyle(
            //                             color: Colors.white.withAlpha(150),
            //                             fontWeight: FontWeight.w500),
            //                       ),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ),
            //             const Spacer(),
            //             Container(
            //               height: 35,
            //               width: 35,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(30),
            //               ),
            //               child: const Icon(
            //                 Icons.play_arrow,
            //                 color: Color(0xFF31314F),
            //                 size: 25,
            //               ),
            //             ),
            //           ],
            //         ),
            //       )
            //   ],
            // ),
            ));
  }
}
