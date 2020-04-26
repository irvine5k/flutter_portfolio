import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/home/home_controller.dart';
import 'package:flutter_portfolio/src/home/home_page.dart';
import 'package:flutter_portfolio/theme_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeController>(
      create: (_) => ThemeController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Provider.of<ThemeController>(context).isDarkTheme
            ? Colors.white
            : Colors.black,
        buttonColor: Provider.of<ThemeController>(context).isDarkTheme
            ? Colors.grey[800]
            : Colors.black,
        backgroundColor: Provider.of<ThemeController>(context).isDarkTheme
            ? Colors.black
            : Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(),
        child: HomePage(),
      ),
    );
  }
}
