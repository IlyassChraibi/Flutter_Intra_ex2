import 'package:json_annotation/json_annotation.dart';

part 'DTO.g.dart';

@JsonSerializable()
class Date {

  int jour;
  int mois;
  int annee;
  String jourDeLaSemaine;

  Date(this.jour, this.mois, this.annee, this.jourDeLaSemaine);

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
  Map<String, dynamic> toJson() => _$DateToJson(this);
}