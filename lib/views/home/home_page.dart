import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './home_controller.dart';
import './widgets/view_family_tree_dialog.dart';
import './option.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    super.key,
  });

  Future<void> _showDialog(
    BuildContext context,
    Option option,
  ) async {
    String? mobile = await showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimens.dimens6.r,
          ),
        ),
        child: Container(
          color: AppColors.colorWhite,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.dimensScreenHorizontalMargin.w,
            vertical: AppDimens.dimens20.h,
          ),
          child: ViewFamilyTreeDialog(
            controller: controller,
          ),
        ),
      ),
    );
    if (mobile != null) {
      controller.verifyMobileNo(option, mobile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.dimensScreenHorizontalMargin.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appIconWidget(),
              _appNameWidget(),
              _spacingWidget(),
              AppFilledButton(
                text: LanguageKey.addHeads.tr,
                onPressed: () => controller.navigateToFamilyHead(),
              ),
              _spacingWidget(),
              AppFilledButton(
                text: LanguageKey.addMembers.tr,
                onPressed: () {
                  _showDialog(context, Option.addMember);
                },
              ),
              _spacingWidget(),
              AppFilledButton(
                text: LanguageKey.viewTree.tr,
                onPressed: () {
                  _showDialog(context, Option.viewTree);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appIconWidget() {
    return AppImageView(
      imagePath: AppAssets.icFamilyConnectSplash,
      width: AppDimens.dimens80.w,
      height: AppDimens.dimens80.w,
      color: AppColors.primary,
    );
  }

  Widget _appNameWidget() {
    return Text(
      AppConfig.appName,
      style: AppTextStyle.textSize32Bold,
    );
  }

  Widget _spacingWidget() {
    return SizedBox(
      height: AppDimens.dimens20.h,
    );
  }
}
