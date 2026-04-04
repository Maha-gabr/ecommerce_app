import 'package:ecommerce_app/api/model/cart/response/add/add_product_dto.dart';
import 'package:ecommerce_app/domain/entities/cart/response/add_product.dart';

extension AddProductMapper on AddProductDto{

  AddProduct toDomain () {
    return AddProduct(
        id: id,
        count: count,
        product: product);
  }}