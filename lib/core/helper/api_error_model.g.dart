// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      type: json['type'] as String?,
      status: json['status'] as int?,
      title: json['title'] as String?,
      traceId: json['traceId'] as String?,
    )..errors = json['errors'] == null
        ? null
        : Errors.fromJson(json['errors'] as Map<String, dynamic>);

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'status': instance.status,
      'errors': instance.errors,
      'traceId': instance.traceId,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      nationalNum: (json['nationalNum'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'nationalNum': instance.nationalNum,
    };
