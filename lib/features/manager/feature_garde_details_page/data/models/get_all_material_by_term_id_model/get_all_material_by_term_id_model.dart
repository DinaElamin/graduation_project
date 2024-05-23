import 'package:json_annotation/json_annotation.dart';

part 'get_all_material_by_term_id_model.g.dart';
@JsonSerializable()
class GetAllMaterialByTermIdModel{
  final int id;
  final String name;
  GetAllMaterialByTermIdModel({required this.id,required this.name});

  Map<String , dynamic> toJson() => _$GetAllMaterialByTermIdModelToJson(this);
  factory GetAllMaterialByTermIdModel.fromJson(Map<String, dynamic> json) => _$GetAllMaterialByTermIdModelFromJson(json);


}
