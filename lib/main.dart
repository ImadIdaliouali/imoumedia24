import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

import './screens/home_page.dart';
import './screens/news_details_screen.dart';

void main() {
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      theme: ThemeData(
        primaryColor: const Color(0xff144CE4),
      ),
      title: 'imoumedia24',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const HomePage(),
        NewsDetailsScreen.screenRoute: (ctx) => const NewsDetailsScreen(),
      },
    );
  }
}
