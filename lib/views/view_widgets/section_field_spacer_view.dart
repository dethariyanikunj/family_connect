import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_utils.dart';

class SectionFieldSpacerView extends StatelessWidget {
  const SectionFieldSpacerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.dimens20.h,
    );
  }
}
