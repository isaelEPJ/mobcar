import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobcar/module/home/home_page.dart';
import 'package:mobcar/module/marcas/marcas_page.dart';
import 'package:mobcar/shared/themes/app_colors.dart';
import 'package:mobcar/shared/themes/app_text_names.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';
import 'package:mobcar/shared/widgets/footer_component.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: AppColors.graySecoundary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width,
            height: size.height * .14,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.settings,
                      color: AppColors.blue,
                    ),
                    Text(
                      AppTextNames.nameApp,
                      style: AppTextStyles.titlenormalBlue,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.menu_outlined,
                    size: 35,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * .6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    style: TextButton.styleFrom(primary: AppColors.blue),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        ModalRoute.withName('/'),
                      );
                    },
                    child: Text(
                      'Home',
                      style: AppTextStyles.titleBlue.copyWith(
                          fontSize: 30, fontWeight: FontWeight.normal),
                    )),
                TextButton(
                    style: TextButton.styleFrom(primary: AppColors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: Text(
                      'Favoritos',
                      style: AppTextStyles.titleBlue.copyWith(
                          fontSize: 30, fontWeight: FontWeight.normal),
                    )),
                TextButton(
                    style: TextButton.styleFrom(primary: AppColors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MarcasPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Marcas',
                      style: AppTextStyles.titleBlue.copyWith(
                          fontSize: 30, fontWeight: FontWeight.normal),
                    )),
                TextButton(
                    style: TextButton.styleFrom(primary: AppColors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MarcasPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sobre',
                      style: AppTextStyles.titleBlue.copyWith(
                          fontSize: 30, fontWeight: FontWeight.normal),
                    )),
              ],
            ),
          ),
          FooterComponent(),
        ],
      ),
    );
  }
}
