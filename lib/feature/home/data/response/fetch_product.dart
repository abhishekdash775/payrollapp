import 'package:json_annotation/json_annotation.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';

part 'fetch_product.g.dart';

@JsonSerializable()
class FetchProduct {
  List<ProductModel>? products;
  FetchProduct({this.products});

  factory FetchProduct.fromJson(Map<String, dynamic> json) =>
      _$FetchProductFromJson(json);

  Map<String, dynamic> toJson() => _$FetchProductToJson(this);

}
