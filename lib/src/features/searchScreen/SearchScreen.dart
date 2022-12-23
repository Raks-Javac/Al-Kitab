import 'package:Al_Kitab/src/features/surah/views/surahList.dart';
import 'package:Al_Kitab/src/shared/widgets/app_bar/backHome.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Row(
                children: [
                  BackButtonWidget(),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          // color: Hexcolor('C4C4C4').withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Center(
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'Plight',
                              fontSize: 14,
                              // color: Hexcolor("C4C4C4").withOpacity(0.9),
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: "Search Al-Kitab",
                              hintStyle: TextStyle(
                                fontFamily: 'Plight',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Search");
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 15, left: 10),
                        child: Text("Search",
                            style: TextStyle(
                                fontFamily: "PMedium",
                                fontSize: 15,
                                color: Colors.white))),
                  )
                ],
              )),
              Flexible(child: SurahList())
            ],
          ),
        )));
  }
}
