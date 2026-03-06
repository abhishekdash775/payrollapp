// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryParams _$QueryParamsFromJson(Map<String, dynamic> json) => QueryParams(
  limit: json['limit'] as num? ?? 10,
  skip: json['skip'] as num? ?? 0,
  search: json['search'] as String?,
);

Map<String, dynamic> _$QueryParamsToJson(QueryParams instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'skip': instance.skip,
      'search': instance.search,
    };
