import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/apptheme.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.isSelected,
    required this.source,
  });
  final bool isSelected;
  final String source;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 10),
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: AppTheme.primaryColor,
            width: 2,
          )),
      child: Text(
        source,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelected ? AppTheme.white : AppTheme.primaryColor),
      ),
    );
  }
}
