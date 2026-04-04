import '../../../../domain/entities/product/response/product.dart';

sealed class ProductTapStates {}

class ProductTapInitialState extends ProductTapStates{}
class ProductTapLoadingState extends ProductTapStates{}
class ProductTapErrorState extends ProductTapStates{
  final String errMessage ;
   ProductTapErrorState({required this.errMessage});

}
class ProductTapSuccessState extends ProductTapStates{
  final List<Product>? productList;
  ProductTapSuccessState({required this.productList});
}

class FavProductTapSuccessState extends ProductTapStates{
  final List<Product>? favList;
  FavProductTapSuccessState({required this.favList});
}

class FavProductTapLoading extends ProductTapStates{

}
class FavProductTapErrorState extends ProductTapStates{}