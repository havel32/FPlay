import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/ui/navigation.dart';

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

    Timer(const Duration(seconds: 1, milliseconds: 500), () async {
      // await _initializeApp();
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            _mainNavigation.initialRoute(), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw const Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.music_note),
            SizedBox(
              height: 8,
            ),
            Text('FPlay')
          ],
        ),
      ),
    );
  }
}
