import 'package:flutter/material.dart';

class KwidgetBackButton extends StatelessWidget {
  const KwidgetBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).textTheme.displayLarge!.color,
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
