import 'package:json_annotation/json_annotation.dart';
part 'query_params.g.dart';

@JsonSerializable()
class QueryParams {
  num limit;
  num skip;
  String? search;
  QueryParams({this.limit = 10, this.skip = 0, this.search});

  factory QueryParams.fromJson(Map<String, dynamic> json) =>
      _$QueryParamsFromJson(json);
  Map<String, dynamic> toJson() => _$QueryParamsToJson(this);
}
