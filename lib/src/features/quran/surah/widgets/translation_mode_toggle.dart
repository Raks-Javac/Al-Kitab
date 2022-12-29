import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums.dart';
import '../../../../shared/res/assets.dart';
import '../../../../shared/res/res.dart';
import '../controller/controller.dart';

class TranslationBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Builder(builder: (context) {
        Provider.of<SurahProvider>(context, listen: false);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                height: 2,
                width: 59,
                color: KAppConstants.appThemeEnum == AppThemeEnum.whiteMode
                    ? KColors.primaryColor
                    : KColors.whiteColor,
              ),
            ),
            addVerticalSpaing(20),
            Text(
              "Reading View",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15.sp,
                    fontFamily: KTypography.boldFontFamilyName,
                  ),
            ),
            addVerticalSpaing(13),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionWidget(
                    isActive:
                        context.watch<SurahProvider>().getTranslationMode ==
                            true,
                    optionTitle: "Arabic and Translation",
                    onTap: () {
                      context
                          .read<SurahProvider>()
                          .changeTranslationState(true);
                    },
                    optionPreviewImage: KAssets.withTransaltionPicture,
                  ),
                  addHorizontalSpacing(40),
                  OptionWidget(
                    isActive:
                        context.watch<SurahProvider>().getTranslationMode ==
                            false,
                    optionTitle: "Arabic",
                    optionPreviewImage: KAssets.arabicOnlyPicture,
                    onTap: () {
                      context
                          .read<SurahProvider>()
                          .changeTranslationState(false);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String? optionTitle;
  final String? optionPreviewImage;
  final bool? isActive;
  final VoidCallback? onTap;
  const OptionWidget({
    Key? key,
    this.onTap,
    this.optionPreviewImage,
    required this.isActive,
    this.optionTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(optionTitle != null);
    assert(optionPreviewImage != null);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 107,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: KColors.primaryColor2,
                width: isActive == true ? 4 : 0,
              ),
              image: DecorationImage(
                image: AssetImage(
                  optionPreviewImage!,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          addVerticalSpaing(5),
          Text(
            optionTitle!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          )
        ],
      ),
    );
  }
}
