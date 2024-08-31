import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/apptheme.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
    );
  }
}
