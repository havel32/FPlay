import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/songs_list_screen/widget/music_list.dart';
import 'package:flutter_application_1/ui/songs_list_screen/widget/play_lists.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  void initState() {
    super.initState();
    // requestPermission();
  }

  Future<bool> requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Storage permission is required to access songs.')),
      );
      return false;
    }
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
                Color(0xFF303151).withAlpha(140),
                Colors.cyan.withAlpha(235)
              ]),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: AppBar(
            //   title: const Text('Songs List'),
            //   actions: [
            //     IconButton(
            //       icon: Icon(Icons.search),
            //       onPressed: () {},
            //     ),
            //   ],
            // ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(top: 20, left: 22),
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
                        "Hello Sir",
                        style: TextStyle(
                            color: Colors.white.withAlpha(240),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "What do you want to hear sir?",
                        style: TextStyle(
                          color: Colors.white.withAlpha(240),
                          fontSize: 16,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 15, right: 20, bottom: 20),
                    child: Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Color(0xFF31314F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
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
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.search,
                                size: 30, color: Colors.white.withAlpha(128)),
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
                      tabs: [
                        Tab(text: 'Songs'),
                        Tab(text: 'Playlists'),
                        Tab(text: 'Albums'),
                        Tab(text: 'Collections'),
                        Tab(text: 'Favorites'),
                      ]),
                  Flexible(
                      flex: 1,
                      child: TabBarView(children: [
                        MusicList(),
                        PlayLists(),
                        Container(),
                        Container(),
                        Container(),
                      ]))
                ],
              ),
            ))
            // body: FutureBuilder<List<SongModel>>(
            //   future: fetchSongs(),
            //   builder: (context, item) {
            //     if (item.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //     if (item.hasError) {
            //       return Center(child: Text('Error: ${item.error}'));
            //     }
            //     if (item.data == null || item.data!.isEmpty) {
            //       return const Center(child: Text('No songs found'));
            //     }
            //     return ListView.builder(
            //       itemBuilder: (context, index) => ListTile(
            //         leading: const Icon(Icons.music_note),
            //         title: Text(item.data![index].title),
            //         subtitle: Text(item.data![index].artist ?? 'Unknown Artist'),
            //         trailing: const Icon(Icons.more_horiz),
            //       ),
            //       itemCount: item.data!.length,
            //     );
            //   },
            // ),
            ),
      ),
    );
  }
}
