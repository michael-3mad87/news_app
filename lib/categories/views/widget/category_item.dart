import 'package:flutter/material.dart';
import 'package:news_app/categories/data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
 const CategoryItem({super.key, required this.categoryModel, required this.index});
 final CategoryModel categoryModel;
 final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadiusDirectional.only(
          topStart: const Radius.circular(25),
          topEnd: const Radius.circular(25),
          bottomEnd: Radius.circular(index.isOdd ? 25 : 0),
          bottomStart: Radius.circular(index.isEven ? 25 : 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              categoryModel.image,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categoryModel.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
