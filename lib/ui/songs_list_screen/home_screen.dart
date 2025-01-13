import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/model_home_screen.dart';
import 'package:flutter_application_1/ui/songs_list_screen/pages/music_list.dart';
import 'package:flutter_application_1/ui/songs_list_screen/pages/play_lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screenModel = ModelHomeScreen();
  late Future<bool> _hasPermission;

  @override
  void initState() {
    super.initState();
    _hasPermission = screenModel.isGrantedAccessToStorage();
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
                  const Color(0xFF303151).withAlpha(150),
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
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // TODO: Implement search functionality
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Icon(
                                    Icons.sort_rounded,
                                    color: Color(0xFF8999CCF),
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Audio Section",
                                style: TextStyle(
                                    color: Colors.white.withAlpha(230),
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, right: 20, bottom: 20),
                            child: Container(
                              height: 50,
                              width: 380,
                              decoration: BoxDecoration(
                                color: const Color(0xFF31314F),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                              unselectedLabelStyle:
                                  const TextStyle(fontSize: 18),
                              labelStyle: const TextStyle(fontSize: 18),
                              indicator: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                width: 3,
                                color: Color(0xFF8999CCF),
                              ))),
                              // labelPadding: EdgeInsets.only(left: 20),
                              tabs: const [
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
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 40),
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
                                      const PlayLists(),
                                      Container(),
                                      Container(),
                                      Container(),
                                    ]));
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ]))),
          ),
        ));
  }
}
