import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobcar/models/anos_model.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobcar/models/marcas_model.dart';
import 'package:mobcar/module/home/home_controller.dart';
import 'package:mobcar/module/home/widgets/filter_tag.dart';
import 'package:mobcar/module/home/widgets/modelo_tile.dart';
import 'package:mobcar/module/marcas/marcas_controller.dart';
import 'package:mobcar/shared/themes/app_colors.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';
import 'package:mobcar/shared/widgets/drawer_home.dart';
import 'package:mobcar/shared/widgets/footer_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final marcasController = MarcasController();

  @override
  void initState() {
    super.initState();
    controller.start(controller.marcaCod.value);
    marcasController.start();
  }

  @override
  Widget build(BuildContext context) {
    _start() {
      return Container();
    }

    _sucess() {
      return ListView.builder(
        itemCount: controller.modelosCar.value.length,
        itemBuilder: (context, index) {
          final ModelosCar modeloCar = controller.modelosCar.value[index];
          final AnosModel anosModel = controller.anos.value[1];
          final MarcasModel marca = marcasController.marcas.value[0];
          return ModeloTile(anosModel: anosModel, modelosCar: modeloCar);
        },
      );
    }

    _loading() {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    _error() {
      return Container(
        child: ElevatedButton(
          child: Text('Erro, tente novamente'),
          onPressed: () {
            controller.start(21);
          },
        ),
      );
    }

    statemanagement(HomeState state) {
      switch (state) {
        case HomeState.loading:
          return _loading();
        case HomeState.start:
          return _start();
        case HomeState.error:
          return _error();
        case HomeState.sucess:
          return _sucess();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.whitePrimary,
      endDrawer: const DrawerHome(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Column(
          children: [
            Icon(
              CupertinoIcons.settings,
              color: AppColors.blue,
            ),
            Text(
              'MobCar',
              style: AppTextStyles.titleBlue,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      'Modelos',
                      style: AppTextStyles.titleBlue,
                    ),
                  ),
                  Container(),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .06,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: marcasController.marcas.value
                          .map(
                            (e) => FilterTag(
                              model: e,
                              onPressed: () {
                                controller.start(int.parse(e.codigo!));
                              },
                              selected: false,
                            ),
                          )
                          .toList(),
                    ),
                  )),
              Container(
                height: MediaQuery.of(context).size.height * .77,
                child: AnimatedBuilder(
                  animation: controller.state,
                  builder: (context, child) {
                    return statemanagement(controller.state.value);
                  },
                ),
              ),
              const FooterComponent()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue.withOpacity(0.9),
        onPressed: () {},
        child: const Icon(
          CupertinoIcons.add,
          size: 30,
        ),
      ),
    );
  }
}
