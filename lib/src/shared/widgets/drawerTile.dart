import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerTile extends StatelessWidget {
  final Function? onPressed;
  final String? tileName;
  final String? iconPath;
  final String? analysisNumber;

  const DrawerTile({
    Key? key,
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
          onTap: onPressed as void Function()?,
          leading: ImageIcon(
            AssetImage("$iconPath"),
            color: Colors.grey,
            size: 19,
          ),
          title: Text(
            "$tileName",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: "PLight",
                  fontSize: 15.sp,
                ),
          ),
          trailing: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: Color(0xFF53397C),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Center(
              child: Text(
                "$analysisNumber",
                style: TextStyle(
                    fontSize: 17.sp, fontFamily: "RSR", color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
