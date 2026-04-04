import 'package:ecommerce_app/api/mapper/product_mapper.dart';
import 'package:ecommerce_app/api/model/cart/response/get/get_products_dto.dart';

import '../../domain/entities/cart/response/get/get_product.dart';

extension GetProductsMapper on GetProductsDto{
  GetProducts toDomain(){
    return GetProducts(
      id: id,
      count: count,
      price: price,
      product: product?.toDomain()



    );
  }
}