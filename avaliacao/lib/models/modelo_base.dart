abstract class ModeloBase {
  ModeloBase();

  Object? get id;
  String get nome;

  Map<String, dynamic> toJson();
}
