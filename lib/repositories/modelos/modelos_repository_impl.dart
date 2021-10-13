import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobcar/models/anos_model.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobcar/repositories/modelos/modelos_repository.dart';

class ModelosRepositoryImpl implements ModelosRepository {
  final dio = Dio();
  final years = ValueNotifier<List>([]);
  final favoriteList = ValueNotifier<List>([]);

  @override
  Future<List<ModelosCar>> getModelos(int marca) async {
    try {
      var url =
          'https://parallelum.com.br/fipe/api/v1/carros/marcas/$marca/modelos';

      final response = await dio.get(url);

      final data = response.data['modelos'];
      final list = data as List;
      List<ModelosCar> modelos = [
        // ModelosCar(nome: 'isael', codigo: 111111),
      ];

      for (var modl in list) {
        final m = ModelosCar.fromJson(modl);
        modelos.add(m);
      }
      return modelos;
    } catch (err) {
      throw Error;
    }
  }

  @override
  Future<List<AnosModel>> getCarsAndYears(int marca) async {
    try {
      var url =
          'https://parallelum.com.br/fipe/api/v1/carros/marcas/$marca/modelos';

      final response = await dio.get(url);

      final data = response.data['anos'];
      final list = data as List;
      List<AnosModel> anos = [];

      for (var a in list) {
        final ano = AnosModel.fromJson(a);
        anos.add(ano);
      }
      return anos;
    } catch (err) {
      throw Error;
    }
  }
}
