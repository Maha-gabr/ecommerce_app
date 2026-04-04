import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/cashe/shared_prefs_utiles.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/features/main_layout/products/cubit/product_tap_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/product/response/product.dart';
import '../../../../domain/usecase/product/product_use_case.dart';

@injectable
class ProductTapViewModel extends Cubit<ProductTapStates>{
  final GetAllProductUseCase _allProductUseCase;
  ProductTapViewModel(this._allProductUseCase):super(ProductTapInitialState());
   List<Product>? productList;
  List<Product> get favList {
   return productList?.where((e) => favProductIds.contains(e.id)).toList() ?? [];
  }
  Set<String> favProductIds = {};
  bool isFav(String productId) => favProductIds.contains(productId);
Future<void> getProduct() async {
  try{
    emit(ProductTapLoadingState());
     productList =await _allProductUseCase.invoke();
    emit(ProductTapSuccessState(productList: productList));
  }on AppExceptions catch(e){
    emit(ProductTapErrorState(errMessage: e.message));
  }
}

  Future<void> addProductToFavourite(String productId) async {
    if (favProductIds.contains(productId)) {
      favProductIds.remove(productId);
    } else {
      favProductIds.add(productId);
    }
   await _saveFav();

    emit(FavProductTapSuccessState(favList: productList));
  }

  Future<void> _saveFav () async {
  final token = SharedPrefsUtils.getData(key: 'token') as String? ?? '';
  await SharedPrefsUtils.saveData(key: 'fav_$token', value: favProductIds.join(','));
  }
  void _loadFav (){
    final token = SharedPrefsUtils.getData(key: 'token') as String? ??''  ;
    final fav = SharedPrefsUtils.getData(key: 'fav_$token') as String? ??'';
    if (fav.isNotEmpty) {
      favProductIds = fav.split(',').toSet();
    }
  }


}