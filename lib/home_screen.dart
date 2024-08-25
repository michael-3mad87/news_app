import 'package:flutter/material.dart';
import 'package:news_app/apptheme.dart';
import 'package:news_app/category/category_grid.dart';
import 'package:news_app/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routName = '/';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage(
              "assets/images/pattern.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar:  AppBar(
          title: const Text(
            'News App',
          ),
        ),
        body:const CategoryGrid(),
          drawer: const HomeDrawer(),
      ),
    );
  }
}
