import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Function onPressed;
  final String tileName;
  final String iconPath;
  final String analysisNumber;

  const DrawerTile({
    Key key,
    this.onPressed,
    this.analysisNumber,
    this.iconPath,
    this.tileName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          leading: ImageIcon(
            AssetImage("$iconPath"),
            color: Colors.grey,
            size: 19,
          ),
          title: Text(
            "$tileName",
            style: TextStyle(
                fontFamily: "PLight",
                fontSize: 17,
                color: Colors.white.withOpacity(0.8)),
          ),
          trailing: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: Color(0xFF53397C),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "$analysisNumber",
                style: TextStyle(
                    fontSize: 20, fontFamily: "RSR", color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
