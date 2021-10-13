import 'package:mobcar/models/anos_model.dart';
import 'package:mobcar/models/car_model.dart';

abstract class ModelosRepository {
  Future<List<ModelosCar>> getModelos(int marca);
  Future<List<AnosModel>> getCarsAndYears(int marca);
}
