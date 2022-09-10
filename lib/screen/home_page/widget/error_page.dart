import 'package:flutter/material.dart';

import '../../../component/style.dart';

class ErrorPage extends StatelessWidget {
  final BuildContext context;
  const ErrorPage({required this.context, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: primaryColor,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Sorry data can\'t displayed',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ));
  }
}
