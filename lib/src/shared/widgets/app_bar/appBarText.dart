import 'package:flutter/material.dart';

class BarText extends StatelessWidget {
  final String? appBarText;
  const BarText({
    Key? key,
    required this.appBarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      appBarText!,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
    );
  }
}
