import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/navigation.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final _mainNavigation = MainNavigation();
  bool _isGrantedStoragePermission = false;
  final OnAudioQuery _audioQuery = OnAudioQuery();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    Timer(const Duration(seconds: 2, milliseconds: 500), () async {
      await _initializeApp();
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            _mainNavigation.initialRoute(), (route) => false);
      }
    });
  }

  Future<void> _initializeApp() async {
    await _requestPermissionStorage();
    if (_isGrantedStoragePermission) await _preloadData();
  }

  Future<void> _requestPermissionStorage() async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    Permission permission = Permission.storage;

    if (build.version.sdkInt < 30) {
      var request = await Permission.manageExternalStorage.request();
      if (request.isGranted) {
        // Продолжить загрузку приложения
        _isGrantedStoragePermission = true;
      } else {
        // Отказ в доступе к памяти
        _isGrantedStoragePermission = false;
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Storage permission is required to access songs.')),
          );
        }
      }
    } else {
      if (await permission.isGranted) {
        // Продолжить загрузку приложения
        _isGrantedStoragePermission = true;
      } else {
        var result = await permission.request();
        if (result.isGranted) {
          // Продолжить загрузку приложения
          _isGrantedStoragePermission = true;
        } else {
          // Отказ в доступе к памяти
          _isGrantedStoragePermission = false;
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Storage permission is required to access songs.')),
            );
          }
        }
      }
    }
  }

  Future<List<SongModel>> _preloadData() async {
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _animation.value,
          duration: Duration(seconds: 2),
          child: Text(
            'FPlay',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
