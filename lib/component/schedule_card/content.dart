import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String content;

  const Content({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(content));
  }
}
