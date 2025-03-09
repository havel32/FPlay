import 'package:flutter/material.dart';
import 'package:f_play/presentation/intro/pages/get_started.dart';

import '../presentation/choose_mode/pages/choose_mode.dart';
import '../presentation/splash/pages/splash.dart';

class ScreenFactory {
  // Splash

  Widget makeSplashScreen() {
    return const SplashScreen();
  }

  Widget makeGetStartedPage() {
    return const GetStarted();
  }

  Widget makeChooseModePage() {
    return const ChooseModePage();
  }

}