import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Quote {
  final String quoteSurah;
  final String quoteText;
  final String quoteReference;
  Quote({this.quoteReference, this.quoteSurah, this.quoteText});
}

class QuoteModel extends Model {
  final _quote = Quote(
    quoteSurah: 'Suratul Hadid',
    quoteReference: 'Q57 v4',
    quoteText:
        'He is with you wherever you are, and Allah is watchful of whatever you do.',
  );

//this get the properties of the Quote class set in _quote variable
  String get quoteSurah => _quote.quoteSurah;
  String get getquoteReference => _quote.quoteReference;
  String get quoteText => _quote.quoteText;

//this function makes the model more readable for frequent acess
  static QuoteModel of(BuildContext context) =>
      ScopedModel.of<QuoteModel>(context);
}
