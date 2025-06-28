import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_utils.dart';

class FieldSpacerView extends StatelessWidget {
  const FieldSpacerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.dimens10.h,
    );
  }
}
