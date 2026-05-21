//basico que outros modelos devem seguir
abstract class ModeloBase {
  ModeloBase();

  Object? get id;
  String get nome;

  //função que obriga implementacao de conversao pra json 
  Map<String, dynamic> toJson();
}
