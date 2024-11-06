import 'package:dum/constants/routes.dart';
import 'package:dum/home_page.dart';
import 'package:dum/login_page.dart';
import 'package:dum/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        
        useMaterial3: true,
      ),
      supportedLocales: const [Locale('en'),Locale('th')],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const MyHomePage(),
      routes: {
        loginRoute : (context) => const LoginPage(),
        homeRoute : (context) => const  MyHomePage(),
        menuRoute : (context) => const  MenuPage()
        
        

      },
    );
  }
}
