import 'package:flutter/material.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home/views/home_screen.dart';
import 'package:news_app/news/view/widget/news_details.dart';
import 'package:provider/provider.dart';

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
        HomeScreen.routeName: (_) => ChangeNotifierProvider(
          create: (_) => NewsViewModel(),
          child: const HomeScreen()),
        NewsDetails.routeName:(_)=> const NewsDetails(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
