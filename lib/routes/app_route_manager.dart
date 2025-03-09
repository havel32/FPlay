import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class NavigatorManager {
  final GoRouter router = AppRoutes.appRouter;

  NavigatorManager();

  void navigateToSplashScreen() {
    router.go(MainNavigationRoutesNames.splashScreen);
  }
  void navigateToGetStartedPage() {
    router.go(MainNavigationRoutesNames.getStartedPage);
  }
  void navigateToChooseModePage() {
    router.go(MainNavigationRoutesNames.chooseMode);
  }
}