import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobcar/models/anos_model.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobcar/shared/themes/app_colors.dart';
import 'package:mobcar/shared/themes/app_images.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';

class ShowModelDialog extends StatelessWidget {
  final AnosModel anosModel;
  final ModelosCar modelosCar;
  const ShowModelDialog(
      {Key? key, required this.anosModel, required this.modelosCar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              onPrimary: AppColors.whitePrimary,
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Reservar',
            ),
          ),
        ),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(CupertinoIcons.car_detailed),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 200,
            child: Text(
              modelosCar.nome ?? 'Sem nome',
              style: AppTextStyles.titleListTile,
            ),
          ),
          IconButton(
            icon: Icon(CupertinoIcons.xmark),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.logo,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  modelosCar.nome!,
                  style: AppTextStyles.normalTextPrimary.copyWith(fontSize: 15),
                ),
                Text(
                  modelosCar.nome!,
                  style: AppTextStyles.normalTextPrimary.copyWith(fontSize: 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  anosModel.nome!,
                  style: AppTextStyles.normalTextPrimary.copyWith(fontSize: 15),
                ),
                Text(
                  anosModel.codigo.toString(),
                  style: AppTextStyles.normalTextPrimary.copyWith(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
