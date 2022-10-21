import 'package:json_annotation/json_annotation.dart';
part 'transfer.g.dart';
// flutter pub run build_runner build

@JsonSerializable()
class Info {
  String mois;
  String annee;
  String jour;

  Info(this.mois, this.annee,this.jour);

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}