import 'package:flutter/material.dart';
import 'package:news_app/apptheme.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/models/category_Model.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.onCategorySelected});
  final void Function(CategoryModel) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: 'Sports',
        image: 'assets/images/ball.png',
        color: AppTheme.red,
        title: 'Sport',
      ),
      CategoryModel(
         id: 'Sports',
        image: 'assets/images/ball.png',
        color: Colors.red,
        title: 'Sport',
      ),
      CategoryModel(
         id: 'Sports',
        image: 'assets/images/ball.png',
        color: Colors.red,
        title: 'Sport',
      ),
      CategoryModel(
         id: 'Sports',
        image: 'assets/images/ball.png',
        color: Colors.red,
        title: 'Sport',
      ),
      CategoryModel(
         id: 'Sports',
        image: 'assets/images/ball.png',
        color: Colors.red,
        title: 'Sport',
      ),
      CategoryModel(
         id: 'Sports',
        image: 'assets/images/ball.png',
        color: Colors.red,
        title: 'Sport',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.navy,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];
                return GestureDetector(
                    onTap: () {
                      onCategorySelected(category);
                    },
                    child: CategoryItem(
                      categoryModel: categories[index],
                      index: index,
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
