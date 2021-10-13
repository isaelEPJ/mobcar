import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobcar/models/anos_model.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobcar/shared/themes/app_colors.dart';
import 'package:mobcar/shared/themes/app_images.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';

class CreateModelDialog extends StatelessWidget {
  final AnosModel anosModel;
  final ModelosCar modelosCar;
  const CreateModelDialog(
      {Key? key, required this.anosModel, required this.modelosCar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 145),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: AppColors.primary,
                    ),
                  ),
                  primary: AppColors.whitePrimary,
                  onPrimary: AppColors.primary,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancelar',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                  onPrimary: AppColors.whitePrimary,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Salvar',
                ),
              ),
            ],
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
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.logo,
              fit: BoxFit.cover,
            ),
            Container(
              height: 43,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Marca',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Container(
              height: 43,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Modelo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Container(
              height: 43,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ano',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Container(
              height: 43,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Valor(R\$)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
