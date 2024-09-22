import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/news_search/view_model/cubit/search_cubit.dart';
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
    BlocProvider.of<SearchCubit>(context).searchNews(query);
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
                      BlocProvider.of<SearchCubit>(context).emit(SearchInitial());
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
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const LoadingState();
            } else if (state is SearchSuccess) {
              return SearchResultUI(news: state.searchNews);
            } else if (state is SearchError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return selectedCategory != null
                  ? CategoryDetails(selectedCategory!.id)
                  : selectedDrawerItem == DrawerItem.categories
                      ? CategoryGrid(onCategorySelected: onCategorySelected)
                      : const SettingTap();
            }
          },
        ),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
      ),
    );
  }
}
