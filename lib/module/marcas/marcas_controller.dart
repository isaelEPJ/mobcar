import 'package:flutter/widgets.dart';
import 'package:mobcar/models/marcas_model.dart';
import 'package:mobcar/models/modelos_model.dart';
import 'package:mobcar/repositories/marcas/marcas_repository.dart';
import 'package:mobcar/repositories/marcas/marcas_repository_impl.dart';

class MarcasController {
  // List<MarcasModel> marcas = [];
  final marcas = ValueNotifier<List<MarcasModel>>([]);

  List<ModeloModel> modeloPorMarca = [];

  final MarcasRepository _repository;

  final state = ValueNotifier<MarcasState>(MarcasState.start);

  MarcasController([MarcasRepositoryImpl? repository])
      : _repository = repository ?? MarcasRepositoryImpl();

  Future start() async {
    state.value = MarcasState.loading;
    try {
      marcas.value = await _repository.getMarcas();
      state.value = MarcasState.sucess;
    } catch (error) {
      state.value = MarcasState.error;
    }
  }

  Future filter(int code) async {
    state.value = MarcasState.loading;

    try {
      if (modeloPorMarca.isEmpty) {
        // modeloPorMarca[1] = await _repository.getModeloByMarca(code);
      }
      state.value = MarcasState.sucess;
    } catch (error) {
      state.value = MarcasState.error;
    }
  }
}

enum MarcasState {
  start,
  loading,
  sucess,
  error,
}
