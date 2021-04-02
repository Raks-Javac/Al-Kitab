import 'package:Al_Kitab/src/models/appTexts/quote.dart';
import 'package:Al_Kitab/src/screens/stylesheet/AlKitabHomeStyle.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Quranqoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScopedModel(
      model: new QuoteModel(),
      child: Container(
        height: 150,
        margin: EdgeInsets.only(left: 20, right: 20),
        child:
            ScopedModelDescendant<QuoteModel>(builder: (context, child, model) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  "assets/images/quran.jpg",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                child: Positioned(
                  top: 24,
                  left: 15,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/lastReadIcon.png"),
                              color: quoteReadColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${model.quoteSurah}",
                              style: customLastRead,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          width: 170,
                          child: Text("${model.quoteText}",
                              textAlign: TextAlign.start,
                              style: lastReadTextStyle.copyWith(
                                fontSize: 11.5,
                              )),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text("${model.getquoteReference}",
                            textAlign: TextAlign.start,
                            style: lastReadTextStyle.copyWith(
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
