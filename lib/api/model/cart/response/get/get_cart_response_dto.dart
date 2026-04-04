import 'package:json_annotation/json_annotation.dart';

import 'get_cart_dto.dart';
import 'get_products_dto.dart';

part 'get_cart_response_dto.g.dart';

@JsonSerializable()
class GetCartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final GetCartDto? data;

  GetCartResponseDto ({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory GetCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartResponseDtoToJson(this);
  }
}
//
// @JsonSerializable()
// class Product {
//   @JsonKey(name: "subcategory")
//   final List<Subcategory>? subcategory;
//   @JsonKey(name: "_id")
//   final String? Id;
//   @JsonKey(name: "title")
//   final String? title;
//   @JsonKey(name: "quantity")
//   final int? quantity;
//   @JsonKey(name: "imageCover")
//   final String? imageCover;
//   @JsonKey(name: "category")
//   final Category? category;
//   @JsonKey(name: "brand")
//   final Brand? brand;
//   @JsonKey(name: "ratingsAverage")
//   final double? ratingsAverage;
//   @JsonKey(name: "id")
//   final String? id;
//
//   Product ({
//     this.subcategory,
//     this.Id,
//     this.title,
//     this.quantity,
//     this.imageCover,
//     this.category,
//     this.brand,
//     this.ratingsAverage,
//     this.id,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return _$ProductFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$ProductToJson(this);
//   }
// }
//
// @JsonSerializable()
// class Subcategory {
//   @JsonKey(name: "_id")
//   final String? Id;
//   @JsonKey(name: "name")
//   final String? name;
//   @JsonKey(name: "slug")
//   final String? slug;
//   @JsonKey(name: "category")
//   final String? category;
//
//   Subcategory ({
//     this.Id,
//     this.name,
//     this.slug,
//     this.category,
//   });
//
//   factory Subcategory.fromJson(Map<String, dynamic> json) {
//     return _$SubcategoryFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$SubcategoryToJson(this);
//   }
// }
//
// @JsonSerializable()
// class Category {
//   @JsonKey(name: "_id")
//   final String? Id;
//   @JsonKey(name: "name")
//   final String? name;
//   @JsonKey(name: "slug")
//   final String? slug;
//   @JsonKey(name: "image")
//   final String? image;
//
//   Category ({
//     this.Id,
//     this.name,
//     this.slug,
//     this.image,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return _$CategoryFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$CategoryToJson(this);
//   }
// }
//
// @JsonSerializable()
// class Brand {
//   @JsonKey(name: "_id")
//   final String? Id;
//   @JsonKey(name: "name")
//   final String? name;
//   @JsonKey(name: "slug")
//   final String? slug;
//   @JsonKey(name: "image")
//   final String? image;
//
//   Brand ({
//     this.Id,
//     this.name,
//     this.slug,
//     this.image,
//   });
//
//   factory Brand.fromJson(Map<String, dynamic> json) {
//     return _$BrandFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$BrandToJson(this);
//   }
// }
//
//
