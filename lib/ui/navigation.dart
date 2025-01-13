import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/songs_list_screen/pages/music_page.dart';
import 'package:flutter_application_1/ui/songs_list_screen/pages/play_list_page.dart';
import 'package:flutter_application_1/ui/songs_list_screen/home_screen.dart';
import 'package:flutter_application_1/ui/splash_screen/splash_screen.dart';

abstract class MainNavigationRoutesNames {
  static const String home = 'home';
  static const String splashScreen = 'splash_screen';
  static const String musicPage = 'music_page';
  static const String playListPage = 'play_list_page';
}

class MainNavigation {
  String initialRoute() {
    return MainNavigationRoutesNames.home;
  }

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.home: (context) => const HomeScreen(),
    MainNavigationRoutesNames.splashScreen: (context) => const SplashScreen(),
    MainNavigationRoutesNames.musicPage: (context) => const MusicPage(),
    MainNavigationRoutesNames.playListPage: (context) => const PlayListPage(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutesNames.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case MainNavigationRoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case MainNavigationRoutesNames.musicPage:
        return MaterialPageRoute(builder: (context) => const MusicPage());
      case MainNavigationRoutesNames.playListPage:
        return MaterialPageRoute(builder: (context) => const PlayListPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
