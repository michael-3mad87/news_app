import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/news_search/view_model/cubit/search_cubit.dart';
import 'package:news_app/news/view_model/cubit/news_cubit.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home/views/home_screen.dart';
import 'package:news_app/news/view/widget/news_details.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (_) => SearchCubit(),
        ),
         BlocProvider<NewsCubit>(
          create: (_) => NewsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          NewsDetails.routeName: (_) => const NewsDetails(),
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
