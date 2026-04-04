
import 'package:ecommerce_app/domain/entities/product/response/product.dart';

import '../../category_or_brand/response/common/meta_data.dart';

class ProductResponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductResponse ({
    this.results,
    this.metadata,
    this.data,
  });


}



