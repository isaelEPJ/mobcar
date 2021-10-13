import 'package:flutter/material.dart';
import 'package:mobcar/models/modelos_model.dart';
import 'package:mobcar/module/marcas/marcas_controller.dart';
import 'package:mobcar/shared/themes/app_colors.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';
import 'package:mobcar/shared/widgets/drawer_home.dart';
import 'package:mobcar/shared/widgets/footer_component.dart';

class MarcaPage extends StatefulWidget {
  final int codModelo;
  const MarcaPage({Key? key, required this.codModelo}) : super(key: key);

  @override
  State<MarcaPage> createState() => _MarcaPageState();
}

class _MarcaPageState extends State<MarcaPage> {
  final controller = MarcasController();

  @override
  void initState() {
    super.initState();
    controller.filter(widget.codModelo);
  }

  @override
  Widget build(BuildContext context) {
    _start() {
      return Container();
    }

    _sucess() {
      return ListView.builder(
        itemCount: controller.modeloPorMarca.length,
        itemBuilder: (context, index) {
          final ModeloModel marcaCar = controller.modeloPorMarca[index];
          return Text(marcaCar.modelos.toString());
        },
      );
    }

    _loading() {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    _error() {
      return Container(
        child: ElevatedButton(
          child: Text('Erro, tente novamente'),
          onPressed: () {
            controller.start();
          },
        ),
      );
    }

    statemanagement(MarcasState state) {
      switch (state) {
        case MarcasState.loading:
          return _loading();
        case MarcasState.start:
          return _start();
        case MarcasState.error:
          return _error();
        case MarcasState.sucess:
          return _sucess();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.whitePrimary,
      endDrawer: const DrawerHome(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          controller.marcas.value.length.toString(),
          style: AppTextStyles.titleBlue,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .8,
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
    );
  }
}
