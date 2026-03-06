import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'dimensions.dart';
import 'meta.dart';
import 'review.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;
  int quantity;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
  Map<String, dynamic> toDb(int page) {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "price": price?.toStringAsFixed(2),
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "tags": jsonEncode(tags),
      "brand": brand,
      "sku": sku,
      "weight": weight,
      "dimensions": jsonEncode(dimensions?.toJson()),
      "warrantyInformation": warrantyInformation,
      "shippingInformation": shippingInformation,
      "availabilityStatus": availabilityStatus,
      "reviews": jsonEncode(reviews?.map((e) => e.toJson()).toList()),
      "returnPolicy": returnPolicy,
      "minimumOrderQuantity": minimumOrderQuantity,
      "meta": jsonEncode(meta?.toJson()),
      "images": jsonEncode(images),
      "thumbnail": thumbnail,
    };
  }

  ProductModel productFromDb(Map<String, dynamic> map) {
    return ProductModel(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      category: map["category"],
      price: (map["price"] as num?)?.toDouble(),
      discountPercentage: (map["discountPercentage"] as num?)?.toDouble(),
      rating: (map["rating"] as num?)?.toDouble(),
      stock: map["stock"],
      tags: map["tags"] != null
          ? List<String>.from(jsonDecode(map["tags"]))
          : null,
      brand: map["brand"],
      sku: map["sku"],
      weight: map["weight"],
      dimensions: map["dimensions"] != null
          ? Dimensions.fromJson(jsonDecode(map["dimensions"]))
          : null,
      warrantyInformation: map["warrantyInformation"],
      shippingInformation: map["shippingInformation"],
      availabilityStatus: map["availabilityStatus"],
      reviews: map["reviews"] != null
          ? (jsonDecode(map["reviews"]) as List)
                .map((e) => Review.fromJson(e))
                .toList()
          : null,
      returnPolicy: map["returnPolicy"],
      minimumOrderQuantity: map["minimumOrderQuantity"],
      meta: map["meta"] != null ? Meta.fromJson(jsonDecode(map["meta"])) : null,
      images: map["images"] != null
          ? List<String>.from(jsonDecode(map["images"]))
          : null,
      thumbnail: map["thumbnail"],
      quantity: map["quantity"] ?? 1
    );
  }
}
