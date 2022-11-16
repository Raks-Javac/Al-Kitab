import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Greetings {
  final String? greetings;
  final String? peopleGreeted;
  Greetings({this.greetings, this.peopleGreeted});
}

class GreetingsModel extends Model {
  final _greetings = new Greetings(
      greetings: 'As-salam alaykum', peopleGreeted: "'akhi 'wa' 'ukhti'");
//this get the properties of the Greetings class set in _greetings variable
  String? get greeting => _greetings.greetings;
  String? get peopleGreeted => _greetings.peopleGreeted;
//this function makes the model more readable for frequent acess
  static GreetingsModel of(BuildContext context) =>
      ScopedModel.of<GreetingsModel>(context);
}
