import 'package:flutter/material.dart';
import 'package:mobcar/models/marcas_model.dart';
import 'package:mobcar/shared/themes/app_text_styles.dart';

class MarcaTile extends StatefulWidget {
  final MarcasModel marca;

  const MarcaTile({Key? key, required this.marca}) : super(key: key);

  @override
  State<MarcaTile> createState() => _MarcaTileState();
}

final GlobalKey _menuKey = GlobalKey();

class _MarcaTileState extends State<MarcaTile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .9,
      margin: const EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Text(
            widget.marca.codigo ?? '',
            style: AppTextStyles.normalTextPrimary,
          ),
          title: Text(widget.marca.nome ?? 'Marca Desconhecido',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyles.titlenormalBlue
                  .copyWith(fontWeight: FontWeight.bold)),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ),
      ),
    );
  }
}
