
import '../../domain/entities/category_or_brand/response/common/category_or_brand.dart';
import '../model/categoty_or_brand/response/common/category_or_brand_dto.dart';

extension CategorOrBrandDto on CategoryOrBrandDto{

  CategoryOrBrand toDomain(){
    return CategoryOrBrand(
      id: id,
      name: name,
      image: image,
      createdAt: createdAt,
      slug: slug,
      updatedAt: updatedAt

    );
  }

}