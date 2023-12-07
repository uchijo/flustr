import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.title, required this.content});

  final String title;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 5,
        ),
        ...content,
      ],
    );
  }
}
