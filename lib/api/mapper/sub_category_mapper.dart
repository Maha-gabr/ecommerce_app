
import '../../domain/entities/product/response/sub_category.dart';
import '../model/product/response/sub_category_dto.dart';

extension subCategoryMapper on SubcategoryDto{
  Subcategory toDomain(){
    return Subcategory(
        category:category,
      id: id,
      slug: slug,
      name: name,

    );
    }


}