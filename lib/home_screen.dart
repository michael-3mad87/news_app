import 'package:flutter/material.dart';
import 'package:news_app/apptheme.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_grid.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/models/category_Model.dart';
import 'package:news_app/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
        ),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoryGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingTap(),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;
  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {});
    Navigator.pop(context);
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
