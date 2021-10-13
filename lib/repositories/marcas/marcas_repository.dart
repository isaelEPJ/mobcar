import 'package:mobcar/models/marcas_model.dart';

abstract class MarcasRepository {
  Future<List<MarcasModel>> getMarcas();
}
