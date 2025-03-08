import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/configs/assets/app_vectors.dart';
import 'package:flutter_application_1/presentation/ui/navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final _mainNavigation = MainNavigation();

  @override
  void initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          _mainNavigation.initialRoute(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [SvgPicture.asset(AppVectors.logo), const Text('FPlay')],
        ),
      ),
    );
  }
}
