import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_utils.dart';
import './app_widget.dart';

class AppScreenTitleBar extends StatelessWidget {
  const AppScreenTitleBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.isBackButtonVisible = true,
    this.subTitle,
    this.onSubTitlePressed,
  });

  final String title;
  final String? subTitle;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSubTitlePressed;
  final bool isBackButtonVisible;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: Row(
          children: [
            if (!isBackButtonVisible)
              SizedBox(
                width: AppDimens.dimensScreenHorizontalMargin.w,
              ),
            if (isBackButtonVisible)
              SizedBox(
                width: AppDimens.dimens7.w,
              ),
            if (isBackButtonVisible)
              Material(
                color: AppColors.colorTransparent,
                child: InkWell(
                  onTap: () {
                    if (onBackPressed != null) {
                      onBackPressed!();
                    } else {
                      Get.back();
                    }
                  },
                  borderRadius: BorderRadius.circular(
                    AppDimens.dimens20.r,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      AppDimens.dimens15.w,
                    ),
                    child: AppImageView(
                      imagePath: AppAssets.icBackArrow,
                      width: AppDimens.dimens16.w,
                      height: AppDimens.dimens16.w,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.textSize16Bold,
              ),
            ),
            if (subTitle != null)
              GestureDetector(
                onTap: onSubTitlePressed,
                child: Text(
                  subTitle!,
                  style: AppTextStyle.textSize14SemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            if (subTitle != null)
              SizedBox(
                width: AppDimens.dimensScreenHorizontalMargin.w,
              ),
          ],
        ),
      ),
    );
  }
}
