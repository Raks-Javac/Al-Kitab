import 'package:flutter/material.dart';

kWidgetsBottomSheet(
  BuildContext context,
  Widget sheetBody,
) {
  showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    useRootNavigator: true,
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    anchorPoint: const Offset(0, 200),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
    ),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: sheetBody,
    ),
  );
}
