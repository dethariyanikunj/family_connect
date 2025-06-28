import 'package:flutter/material.dart';

import '../../utils/app_utils.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
    required this.header,
  });

  final String header;

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: AppTextStyle.textSize14SemiBold,
    );
  }
}
