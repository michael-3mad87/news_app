import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/apptheme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final titleLargeStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            color: AppTheme.primaryColor,
            height: screenSize.height * 0.2,
            width: double.infinity,
            child: Center(
              child: Text('News App!',
                  style: titleLargeStyle?.copyWith(fontSize: 24)),
            ),
          ),
          Expanded(
            child: Container(
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                         const Icon(Icons.menu , size: 28,),
                         const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Categories",
                            style: titleLargeStyle?.copyWith(
                                fontSize: 24, color: AppTheme.black),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                       const Icon(
                            Icons.settings,
                            size: 28,
                          ),
                         const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Settings",
                            style: titleLargeStyle?.copyWith(
                                fontSize: 24, color: AppTheme.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
