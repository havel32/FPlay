// ignore_for_file: deprecated_member_use

import 'package:f_play/routes/screen_factory.dart';
import 'package:go_router/go_router.dart';

abstract class MainNavigationRoutesNames {
  static const String splashScreen = '/';
  static const String getStartedPage = '/start';
  static const String chooseMode = '/start/choose_mode';

}

final _screenFactory = ScreenFactory();

class AppRoutes {
  static final GoRouter appRouter = GoRouter(
    initialLocation: MainNavigationRoutesNames.splashScreen,
    routes: [
      // Splash
      GoRoute(
          name: MainNavigationRoutesNames.splashScreen,
          path: MainNavigationRoutesNames.splashScreen,
          builder: (context, state) => _screenFactory.makeSplashScreen()),
      GoRoute(
          name: MainNavigationRoutesNames.getStartedPage,
          path: MainNavigationRoutesNames.getStartedPage,
          builder: (context, state) => _screenFactory.makeGetStartedPage()),
      GoRoute(
          name: MainNavigationRoutesNames.chooseMode,
          path: MainNavigationRoutesNames.chooseMode,
          builder: (context, state) => _screenFactory.makeChooseModePage()),
    ],
  );
}