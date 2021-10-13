import 'package:flutter/material.dart';
import 'package:mobcar/models/anos_model.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobcar/shared/dialogs/create_model_dialog.dart';
import 'package:mobcar/shared/dialogs/show_Model_dialog.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';

class ModeloTile extends StatefulWidget {
  final AnosModel anosModel;
  final ModelosCar modelosCar;
  const ModeloTile(
      {Key? key, required this.anosModel, required this.modelosCar})
      : super(key: key);

  @override
  State<ModeloTile> createState() => _ModeloTileState();
}

final GlobalKey _menuKey = GlobalKey();

class _ModeloTileState extends State<ModeloTile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .9,
      height: size.height * .11,
      margin: const EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Text(
            widget.modelosCar.codigo.toString(),
            style: AppTextStyles.normalTextPrimary,
          ),
          title: Text(widget.modelosCar.nome ?? 'Nome Desconhecido',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyles.titlenormalBlue
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(widget.anosModel.nome ?? ' Ano desconhecido'),
          trailing: PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 0) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => ShowModelDialog(
                    anosModel: widget.anosModel,
                    modelosCar: widget.modelosCar,
                  ),
                );
              } else if (value == 1) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => CreateModelDialog(
                    anosModel: widget.anosModel,
                    modelosCar: widget.modelosCar,
                  ),
                );
              } else if (value == 2) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Center(
                    child: Text('Modelo Removido'),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                  value: 0,
                  child: Text(
                    'Vizualizar',
                  )),
              const PopupMenuItem(
                value: 1,
                child: Text(
                  'Editar',
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text(
                  'Remover',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
