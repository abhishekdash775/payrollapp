// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchProduct _$FetchProductFromJson(Map<String, dynamic> json) => FetchProduct(
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FetchProductToJson(FetchProduct instance) =>
    <String, dynamic>{'products': instance.products};
