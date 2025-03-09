import 'dart:async';
import 'package:flutter/material.dart';
import 'package:f_play/core/configs/assets/app_vectors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.goNamed(MainNavigationRoutesNames.getStartedPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppVectors.logo,
                width: 150,
              ))
        ],
      ),
    );
  }
}
