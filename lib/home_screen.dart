import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/apptheme.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_grid.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/models/category_Model.dart';
import 'package:news_app/models/news_respones/news_respones.dart';
import 'package:news_app/settings/settings.dart';
import 'package:news_app/widgets/search_result_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  NewsResponse? newsRespones;
  Future<void> onsubmited(String query) async {
    final respone = await APIservices.searchNews(query);
    setState(() {
      newsRespones = respone;
    });
  }

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
          title: isSearching
              ? TextField(
                  onSubmitted: (value) {
                    onsubmited(value);
                  },
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search News',
                    hintStyle: TextStyle(color: AppTheme.white),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: AppTheme.white),
                  cursorColor: AppTheme.white,
                )
              : const Text(
                  'News App',
                ),
          leading: isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchController.clear();
                      setState(() {
                        newsRespones = null;
                      });
                    });
                  },
                )
              : null,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: Icon(
                isSearching ? Icons.search : Icons.search,
                size: MediaQuery.of(context).size.width * .07,
              ),
            )
          ],
        ),
        body: newsRespones != null
            ? searchResult()
            : selectedCategory != null
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

  Widget searchResult() {
    if (newsRespones?.articles?.isEmpty ?? true) {
      return const Center(
        child: Text('There are no results'),
      );
    }
    return SearchResultUI(newsRespones: newsRespones);
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
