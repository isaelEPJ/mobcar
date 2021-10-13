import 'package:flutter/widgets.dart';
import 'package:mobcar/models/anos_model.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobcar/models/marcas_model.dart';
import 'package:mobcar/models/modelos_model.dart';
import 'package:mobcar/repositories/marcas/marcas_repository.dart';
import 'package:mobcar/repositories/marcas/marcas_repository_impl.dart';
import 'package:mobcar/repositories/modelos/modelos_repository.dart';
import 'package:mobcar/repositories/modelos/modelos_repository_impl.dart';

class HomeController {
  final marcas = ValueNotifier<List<MarcasModel>>([]);
  final modelosCar = ValueNotifier<List<ModelosCar>>([]);
  final anos = ValueNotifier<List<AnosModel>>([]);

  final marcaCod = ValueNotifier<int>(21);

  final List<ModeloModel> modeloPorMarca = [];
  final MarcasRepository _marcasRepository;
  final ModelosRepository _modelRepository;

  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController(
      [MarcasRepositoryImpl? marcasRepository,
      ModelosRepositoryImpl? modelRepository])
      : _modelRepository = modelRepository ?? ModelosRepositoryImpl(),
        _marcasRepository = marcasRepository ?? MarcasRepositoryImpl();

  Future start(int codMarca) async {
    state.value = HomeState.loading;
    try {
      marcas.value = await _marcasRepository.getMarcas();
      modelosCar.value = await _modelRepository.getModelos(marcaCod.value);
      anos.value = await _modelRepository.getCarsAndYears(marcaCod.value);

      state.value = HomeState.sucess;
    } catch (error) {
      state.value = HomeState.error;
    }
  }

  // Future filter(int code) async {
  //   state.value = HomeState.loading;

  //   try {
  //     modeloPorMarca = await _repository.getModeloByMarca(code);
  //     state.value = HomeState.sucess;
  //   } catch (error) {
  //     state.value = HomeState.error;
  //   }
  // }
}

enum HomeState {
  start,
  loading,
  sucess,
  error,
}
