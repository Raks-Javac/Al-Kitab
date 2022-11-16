import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FadeFromButtom extends StatefulWidget {
  Widget? bottomwidget;
  FadeFromButtom({this.bottomwidget});

  @override
  _FadeFromButtomState createState() => _FadeFromButtomState();
}

class _FadeFromButtomState extends State<FadeFromButtom> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 60, end: 0),
      child: widget.bottomwidget,
      builder: (context, double value, child) {
        return Padding(
          padding: EdgeInsets.only(top: value),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
