import 'package:family_connect/models/family_member_info.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graph;
import 'package:pdf/widgets.dart' as pdf;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

import '../../app_services/firestore_service.dart';
import '../../const/app_const.dart';
import '../../localizations/language_keys.dart';
import '../../models/family_head_info.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';

class FamilyTreeController extends GetxController {
  final ScreenshotController screenshotController = ScreenshotController();
  final graph.Graph graphObj = graph.Graph()..isTree = true;
  final graph.BuchheimWalkerConfiguration builder =
      graph.BuchheimWalkerConfiguration();
  final RxBool isLoading = true.obs;

  String headPhoneNo = '';

  bool get isFamilyTreeAvailable =>
      graphObj.hasNodes() && graphObj.edges.isNotEmpty;

  final List<FamilyMemberInfo> familyMembers = [];

  @override
  void onInit() {
    final arguments = Get.arguments;
    if (arguments is Map<String, dynamic> &&
        arguments.containsKey(AppKeyConst.keyMobileNo)) {
      headPhoneNo = Get.arguments[AppKeyConst.keyMobileNo];
    }
    fetchFamilyTree();
    super.onInit();
  }

  Future<void> fetchFamilyTree() async {
    try {
      isLoading.value = true;
      final familyInfo =
          await FirestoreService().getFamilyHeadWithMembers(headPhoneNo);
      if (familyInfo != null) {
        if (familyInfo.containsKey(FirestoreKeys.familyHeads)) {
          final head = familyInfo[FirestoreKeys.familyHeads];
          graph.Node? headNode;
          if (head is FamilyHeadInfo) {
            headNode = graph.Node.Id('${head.name} - ${head.temple}');
            graphObj.addNode(headNode);
          }
          if (headNode != null &&
              familyInfo.containsKey(FirestoreKeys.familyMembers)) {
            final members = familyInfo[FirestoreKeys.familyMembers];
            if (members is List<FamilyMemberInfo>) {
              familyMembers.clear();
              familyMembers.addAll(members);
              for (final memberInfo in members) {
                final graph.Node child = graph.Node.Id(
                    "${memberInfo.firstName} (${memberInfo.relationToHead})");
                graphObj.addEdge(headNode, child);
              }
            }
          }
        }
      }
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteMember(FamilyMemberInfo member) async {
    await FirestoreService().deleteFamilyMember(
      headMobileNo: headPhoneNo,
      memberDocId: member.firebaseDocId,
    );
    _showToast();
    Get.back();
  }

  void _showToast() {
    AppToastView.showSuccessToast(
      message: LanguageKey.memberDeletedSuccessfully.tr,
    );
  }

  Future<void> exportAsPdf() async {
    final image = await screenshotController.capture();
    if (image != null) {
      final pdfView = pdf.Document();
      pdfView.addPage(
        pdf.Page(
          build: (pdf.Context context) => pdf.Center(
            child: pdf.Image(pdf.MemoryImage(image)),
          ),
        ),
      );
      await Printing.sharePdf(
        bytes: await pdfView.save(),
        filename: '${AppConfig.appName}.pdf',
      );
    }
  }
}
