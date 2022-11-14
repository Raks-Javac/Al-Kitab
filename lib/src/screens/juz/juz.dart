import 'package:Al_Kitab/src/animations/TransitionAnimation.dart';
import 'package:Al_Kitab/src/screens/juz/juzIndex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

class JuzList extends StatelessWidget {
  final int columnCount = 3;

  @override
  Widget build(BuildContext context) {
    _route({Widget screen}) {
      return Navigator.push(
        context,
        PreviewSlideRoute(
          duration: 200,
          preview: screen,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: AnimationLimiter(
          child: GridView.count(
            crossAxisCount: columnCount,
            children: List.generate(
              30,
              (int index) {
                return GestureDetector(
                  onTap: () => _route(
                      screen: Juz(
                    juzIndex: index + 1,
                  )),
                  child: AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 700),
                    child: SlideAnimation(
                      horizontalOffset: 40.0,
                      child: FadeInAnimation(
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Shimmer.fromColors(
                              period: Duration(seconds: 3),
                              baseColor: Colors.grey.withOpacity(0.3),
                              highlightColor: Colors.white.withOpacity(0.2),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(
                                        width: 1, color: Colors.pink),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                margin: EdgeInsets.all(5.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
