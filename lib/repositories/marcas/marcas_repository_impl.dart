import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobcar/models/marcas_model.dart';
import 'package:mobcar/models/modelos_model.dart';
import 'package:mobcar/repositories/marcas/marcas_repository.dart';

class MarcasRepositoryImpl implements MarcasRepository {
  final dio = Dio();
  final url = 'https://parallelum.com.br/fipe/api/v1/carros/marcas';

  Future<List<MarcasModel>> getMarcas() async {
    final response = await dio.get(url);

    final list = response.data as List;

    // List<MarcasModel> marcas = [];
    final marcas = ValueNotifier<List<MarcasModel>>([]);

    for (var json in list) {
      final todo = MarcasModel.fromJson(json);
      marcas.value.add(todo);
    }
    return marcas.value;
  }

  @override
  Future<List<ModeloModel>> getModeloByMarca(int codigoMarca) async {
    try {
      final response = await dio.post(
          'GET: https://parallelum.com.br/fipe/api/v1/carros/marcas/$codigoMarca/modelos');

      final list = response.data as List;

      List<ModeloModel> modelos = [];

      for (var json in list) {
        final mod = ModeloModel.fromJson(json);
        modelos.add(mod);
      }
      return modelos;
    } catch (error) {
      print(error);
      throw error.toString();
    }
  }
}
