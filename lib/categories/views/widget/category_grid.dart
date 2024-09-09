import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/categories/views/widget/category_item.dart';
import 'package:news_app/categories/data/model/category_model.dart';

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
        id: 'business',
        image: 'assets/images/business.png',
        color: const Color(0xffCF7E48),
        title: 'Business',
      ),
      CategoryModel(
        id: 'health',
        image: 'assets/images/health.png',
        color: const Color(0xffED1E79),
        title: 'Health',
      ),
      CategoryModel(
        id: 'science',
        image: 'assets/images/science.png',
        color: const Color(0xffF2D352),
        title: 'Science',
      ),
      CategoryModel(
        id: 'entertainment',
        image: 'assets/images/environment.png',
        color:const Color(0xff4882CF),
        title: 'Entertainment',
      ),
      CategoryModel(
        id: 'general',
        image: 'assets/images/Politics.png',
        color:const Color(0xff003E90),
        title: 'Politics',
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
