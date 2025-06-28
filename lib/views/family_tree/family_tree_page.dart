import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graph;
import 'package:screenshot/screenshot.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './family_tree_controller.dart';
import './widgets/family_list_dialog.dart';

class FamilyTreePage extends GetView<FamilyTreeController> {
  const FamilyTreePage({
    super.key,
  });

  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
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
          child: FamilyListDialog(
            controller: controller,
            members: controller.familyMembers,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = controller.builder
      ..siblingSeparation = 50
      ..levelSeparation = 50
      ..subtreeSeparation = 50
      ..orientation = graph.BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;

    return Scaffold(
      body: Obx(
        () {
          return Column(
            children: [
              AppScreenTitleBar(
                title: LanguageKey.familyTree.tr,
                subTitle: controller.isFamilyTreeAvailable
                    ? LanguageKey.showMembers.tr
                    : null,
                onSubTitlePressed: controller.isFamilyTreeAvailable
                    ? () {
                        _showDialog(context);
                      }
                    : null,
              ),
              Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : (controller.graphObj.hasNodes()) == false
                        ? Center(
                            child: Text(
                              LanguageKey.noFamilyTree.tr,
                              style: AppTextStyle.textSize16SemiBold,
                            ),
                          )
                        : (controller.graphObj.edges.isEmpty)
                            ? Center(
                                child: Text(
                                  LanguageKey.addFamilyMembersToSeeTree.tr,
                                  style: AppTextStyle.textSize16SemiBold,
                                ),
                              )
                            : Screenshot(
                                controller: controller.screenshotController,
                                child: InteractiveViewer(
                                  constrained: false,
                                  boundaryMargin: EdgeInsets.all(
                                    AppDimens.dimens30.w,
                                  ),
                                  child: graph.GraphView(
                                    graph: controller.graphObj,
                                    algorithm: graph.BuchheimWalkerAlgorithm(
                                        config, graph.TreeEdgeRenderer(config)),
                                    builder: (graph.Node node) {
                                      return Container(
                                        padding: EdgeInsets.all(
                                          AppDimens.dimens10.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue.shade100,
                                          borderRadius: BorderRadius.circular(
                                            AppDimens.dimens5.r,
                                          ),
                                        ),
                                        child: Text(
                                          node.key!.value,
                                          style: AppTextStyle.textSize12Regular,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
              ),
              if (controller.isFamilyTreeAvailable)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.dimensScreenHorizontalMargin.w,
                    vertical: AppDimens.dimens20.h,
                  ),
                  child: AppFilledButton(
                    text: LanguageKey.export.tr,
                    onPressed: () => controller.exportAsPdf(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
