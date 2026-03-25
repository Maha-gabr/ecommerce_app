import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';

sealed class HomeTapStates {}

class HomeTapInitialState extends HomeTapStates{}
class HomeTapLoadingState extends HomeTapStates{}
class HomeTapErrorState extends HomeTapStates{
  String errMessage;
  HomeTapErrorState({required this.errMessage});
}

class HomeTapSuccessState extends HomeTapStates{
  List<CategoryOrBrand>? categoriesList;
  List<CategoryOrBrand>? brandsList;
  HomeTapSuccessState({ this.categoriesList, this.brandsList});
  HomeTapSuccessState copyWith(
  {
    List<CategoryOrBrand>? categoriesList,
    List<CategoryOrBrand>? brandsList
}
      ){
    return HomeTapSuccessState(
      categoriesList: categoriesList ?? this.categoriesList,
      brandsList: brandsList ?? this.brandsList
    );
  }
}
