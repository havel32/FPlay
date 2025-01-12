import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/songs_list_screen/pages/music_list.dart';
import 'package:flutter_application_1/ui/songs_list_screen/pages/play_lists.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  late Future<bool> _hasPermission;
  @override
  void initState() {
    super.initState();
    // requestPermission();
    _hasPermission = _requestPermission(Permission.storage);
  }

  Future<List<SongModel>> fetchSongs() async {
    try {
      return await _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
    } catch (e) {
      print('Error fetching songs: $e');
      return [];
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var re = await Permission.manageExternalStorage.request();
      if (re.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await permission.isGranted) {
        return true;
      } else {
        var result = await permission.request();
        if (result.isGranted) {
          return true;
        } else {
          return false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF303151).withAlpha(150),
                  // Color(0xFF303151).withAlpha(200),
                  // Colors.cyan.withAlpha(180),
                  Colors.cyan.withAlpha(235)
                ]),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 22),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // TODO: Implement search functionality
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Icon(
                                    Icons.sort_rounded,
                                    color: Color(0xFF8999CCF),
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Audio Section",
                                style: TextStyle(
                                    color: Colors.white.withAlpha(230),
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              )),
                          // ElevatedButton(
                          //   onPressed: () async {
                          //     if (await _requestPermission(Permission.storage) ==
                          //         true) {
                          //       log("Permission is granted");
                          //     } else {
                          //       log("permission is not granted");
                          //     }
                          //   },
                          //   child: Text('click'),
                          // ),
                          // Padding(
                          //     padding: EdgeInsets.only(bottom: 5),
                          //     child: Text(
                          //       "What do you want to hear sir?",
                          //       style: TextStyle(
                          //         color: Colors.white.withAlpha(240),
                          //         fontSize: 16,
                          //       ),
                          //     )),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 30, right: 20, bottom: 20),
                            child: Container(
                              height: 50,
                              width: 380,
                              decoration: BoxDecoration(
                                color: Color(0xFF31314F),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 50,
                                    width: 200,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Search for songs',
                                        hintStyle: TextStyle(
                                          color: Colors.white.withAlpha(128),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.search,
                                        size: 30,
                                        color: Colors.white.withAlpha(128)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          TabBar(
                              isScrollable: true,
                              unselectedLabelColor: Colors.white.withAlpha(128),
                              labelColor: Colors.white.withAlpha(128),
                              unselectedLabelStyle: TextStyle(fontSize: 18),
                              labelStyle: TextStyle(fontSize: 18),
                              indicator: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                width: 3,
                                color: Color(0xFF8999CCF),
                              ))),
                              // labelPadding: EdgeInsets.only(left: 20),
                              tabs: [
                                Tab(text: 'Songs'),
                                Tab(text: 'Playlists'),
                                Tab(text: 'Albums'),
                                Tab(text: 'Collections'),
                                Tab(text: 'Favorites'),
                              ]),
                          FutureBuilder<bool>(
                            future: _hasPermission,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 60),
                                      Text(
                                        'Checking permission...',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white.withAlpha(128),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CircularProgressIndicator(
                                        color: Colors.white.withAlpha(128),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 40),
                                      Text(
                                        'Error: ${snapshot.error}',
                                        maxLines: 3,
                                      )
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasData &&
                                  snapshot.data == true) {
                                return Flexible(
                                    flex: 1,
                                    child: TabBarView(children: [
                                      MusicList(),
                                      PlayLists(),
                                      Container(),
                                      Container(),
                                      Container(),
                                    ]));
                              } else {
                                return Container(); // Add this line to handle the case when snapshot.data is not true or null
                              }
                            },
                          ),
                        ]))),
          ),
        ));
  }
}
