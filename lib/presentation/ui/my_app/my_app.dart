import 'package:flutter/material.dart';
import 'package:f_play/core/configs/theme/app_theme.dart';
import 'package:f_play/generated/l10n.dart';
import 'package:f_play/routes/app_route_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _mainNavigation = NavigatorManager();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter media application',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: _mainNavigation.router,
    );
  }
}
