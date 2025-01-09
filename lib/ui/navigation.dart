import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/songs_list_screen/songs_list_screen.dart';
import 'package:flutter_application_1/ui/splash_screen/splash_screen.dart';

abstract class MainNavigationRoutesNames {
  static const String home = 'home';
  static const String splashScreen = 'splash_screen';
}

class MainNavigation {
  String initialRoute() {
    return MainNavigationRoutesNames.home;
  }

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.home: (context) => const HomePage(),
    MainNavigationRoutesNames.splashScreen: (context) => const SplashScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutesNames.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case MainNavigationRoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
