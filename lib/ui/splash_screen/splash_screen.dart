import 'dart:async';
import 'dart:developer';

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

  Future<void> _initializeApp() async {
    try {
      _isGrantedStoragePermission = await _requestPermissionStorage();
      if (_isGrantedStoragePermission) {
        log('Storage permission granted, loading data...');
        // await _preloadData();
      }
    } catch (e) {
      log("Error of fetching data: $e");
    }
  }

  Future<bool> _requestPermissionStorage() async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    Permission permission = Permission.storage;

    if (build.version.sdkInt < 30) {
      var request = await Permission.manageExternalStorage.request();
      if (request.isGranted) {
        // Продолжить загрузку приложения
        // _isGrantedStoragePermission = true;
        return true;
      } else {
        // Отказ в доступе к памяти
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Storage permission is required to access songs.')),
          );
        }
        // _isGrantedStoragePermission = false;
        return false;
      }
    } else {
      if (await permission.isGranted) {
        // Продолжить загрузку приложения
        // _isGrantedStoragePermission = true;
        return true;
      } else {
        var result = await permission.request();
        if (result.isGranted) {
          // Продолжить загрузку приложения
          // _isGrantedStoragePermission = true;
          return true;
        } else {
          // Отказ в доступе к памяти
          // _isGrantedStoragePermission = false;
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Storage permission is required to access songs.')),
            );
          }
          return false;
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'FPlay',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      )),
    );
  }
}
