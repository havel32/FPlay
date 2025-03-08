import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/configs/theme/app_theme.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/presentation/ui/navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final mainNavigation = MainNavigation();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      initialRoute: MainNavigationRoutesNames.splashScreen,
    );
  }
}
