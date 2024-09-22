import 'package:flutter/material.dart';
import 'package:news_app/news/news_search/view_model/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home/widgets/drawer/home_drawer.dart';
import 'package:news_app/categories/views/widget/category_details.dart';
import 'package:news_app/categories/views/widget/category_grid.dart';
import 'package:news_app/shared/loading_state.dart';
import 'package:news_app/settings/settings.dart';
import 'package:news_app/news/view/widget/search_result_ui.dart';
import 'package:news_app/categories/data/model/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  Future<void> onSubmitted(String query) async {
    await Provider.of<SearchViewModel>(context, listen: false).searchNews(query);
  }

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

  @override
  Widget build(BuildContext context) {
    final searchViewModel = Provider.of<SearchViewModel>(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  onSubmitted: onSubmitted,
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search News',
                    hintStyle: TextStyle(color: AppTheme.white),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: AppTheme.white),
                  cursorColor: AppTheme.white,
                )
              : const Text('News App'),
          leading: isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchController.clear();
                      searchViewModel.searchResults = [];
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
                size: MediaQuery.of(context).size.width * 0.07,
              ),
            ),
          ],
        ),
        body: searchViewModel.isLoading
            ? const LoadingState()
            : searchViewModel.searchResults.isNotEmpty
                ? searchResult(searchViewModel)
                : selectedCategory != null
                    ? CategoryDetails(selectedCategory!.id)
                    : selectedDrawerItem == DrawerItem.categories
                        ? CategoryGrid(onCategorySelected: onCategorySelected)
                        : const SettingTap(),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
      ),
    );
  }

  Widget searchResult(SearchViewModel searchViewModel) {
    if (searchViewModel.searchResults.isEmpty &&
        searchViewModel.errorMessage != null) {
      return Center(
        child: Text(searchViewModel.errorMessage!),
      );
    }

    return SearchResultUI(news: searchViewModel.searchResults);
  }
}
