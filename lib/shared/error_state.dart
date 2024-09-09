import 'package:flutter/cupertino.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('SomeThing went wrong'),
    );
  }
}
