import 'package:flutter/material.dart';
import 'package:mobcar/models/marcas_model.dart';
import 'package:mobcar/shared/themes/app_colors.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';

class FilterTag extends StatelessWidget {
  final bool selected;
  final VoidCallback onPressed;
  final MarcasModel model;
  const FilterTag({
    Key? key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primary),
          color: selected ? AppColors.blue : AppColors.graySecoundary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(model.nome!,
              style: AppTextStyles.titleBoldBackground
                  .copyWith(fontSize: 16, fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }
}
