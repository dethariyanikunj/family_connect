import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../localizations/language_keys.dart';
import '../../../models/family_member_info.dart';
import '../../../utils/app_utils.dart';
import '../family_tree_controller.dart';

class FamilyListDialog extends StatelessWidget {
  const FamilyListDialog({
    super.key,
    required this.controller,
    required this.members,
  });

  final FamilyTreeController controller;
  final List<FamilyMemberInfo> members;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: AppDimens.dimens200.h,
      child: members.isEmpty
          ? Center(
              child: Text(
                LanguageKey.noFamilyTree.tr,
                style: AppTextStyle.textSize16SemiBold,
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (itemContext, position) {
                final member = members[position];
                return ListTile(
                  title: Text(
                    '${member.firstName} ${member.lastName}',
                    style: AppTextStyle.textSize16SemiBold,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: AppColors.colorD32F2F,
                    iconSize: AppDimens.dimens20.w,
                    onPressed: () {
                      controller.deleteMember(member);
                      Get.back();
                    },
                  ),
                );
              },
              itemCount: members.length,
            ),
    );
  }
}
