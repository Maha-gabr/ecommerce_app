import 'package:ecommerce_app/api/mapper/category_or_brand_dto.dart';
import 'package:ecommerce_app/api/mapper/sub_category_mapper.dart';
import 'package:ecommerce_app/domain/entities/product/response/product.dart';

import '../model/product/response/product_dto.dart';

extension ProductMapper on ProductDto{
  Product toDomain(){
    return Product(
      updatedAt: updatedAt,
      slug: slug,
      createdAt: createdAt,
      id: id,
      title:title,
      brand: brand?.toDomain(),
      category: category?.toDomain(),
      description: description,
      imageCover: imageCover,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      subcategory: subcategory?.map((subCategory) => subCategory.toDomain()).toList(),
      images: images,
      sold: sold,




    );
  }
}