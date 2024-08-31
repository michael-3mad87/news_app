import 'package:flutter/material.dart';
import 'package:news_app/apptheme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/news/news_details.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        NewsDetails.routeName:(_)=>  NewsDetails(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
