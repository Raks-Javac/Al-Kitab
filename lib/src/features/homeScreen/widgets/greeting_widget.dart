import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../models/appTexts/greetings.dart';

class GreetingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<GreetingsModel>(
      model: new GreetingsModel(),
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 20),
        child: ScopedModelDescendant<GreetingsModel>(
            builder: (context, child, model) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greetingsText(context,
                  text: "${model.greeting}",
                  color: Colors.white.withOpacity(0.6)),
              SizedBox(
                height: 16,
              ),
              greetingsText(
                context,
                text: "${model.peopleGreeted}",
                color: Colors.white,
              )
            ],
          );
        }),
      ),
    );
  }

  Text greetingsText(BuildContext context, {String? text, Color? color}) {
    return Text(
      "$text",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
