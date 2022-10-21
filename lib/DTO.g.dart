// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      json['jour'] as int,
      json['mois'] as int,
      json['annee'] as int,
      json['jourDeLaSemaine'] as String,
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'jour': instance.jour,
      'mois': instance.mois,
      'annee': instance.annee,
      'jourDeLaSemaine': instance.jourDeLaSemaine,
    };
