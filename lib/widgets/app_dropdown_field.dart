import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_utils.dart';

class AppDropdownField extends StatelessWidget {
  final String title;
  final String? value;
  final List<String> items;
  final Function(String?)? onChanged;
  final EdgeInsetsGeometry? padding;

  const AppDropdownField({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    this.onChanged,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: AppDimens.dimens8.h,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: AppDimens.dimensOutlinedInputFieldSeparateTitleSpacing.h,
          ),
          DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            decoration: InputDecoration(
              border: AppInputFieldStyles().outlineInputFieldBorder,
              enabledBorder:
                  AppInputFieldStyles().outlineInputFieldEnabledBorder,
              focusedBorder:
                  AppInputFieldStyles().outlineInputFieldFocusedBorder,
              errorBorder: AppInputFieldStyles().outlineInputFieldErrorBorder,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppDimens.dimens12.h,
                vertical: AppDimens.dimens12.w,
              ),
            ),
            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
