import 'package:flutter/material.dart';
import 'package:mobcar/shared/themes/app_colors.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .06,
      color: AppColors.primary,
      alignment: Alignment.centerLeft,
      child: Text(
        ' © 2021. All rights reserved to Mobcar.',
        style: AppTextStyles.titlenormalBlue
            .copyWith(fontStyle: FontStyle.normal, fontWeight: FontWeight.w100),
      ),
    );
  }
}
