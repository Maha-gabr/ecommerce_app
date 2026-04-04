import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/features/products_screen/cubit/product_tap_states.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/product/product_use_case.dart';
@injectable
class ProductTapViewModel extends Cubit<ProductTapStates>{
  final GetAllProductUseCase _allProductUseCase;
  ProductTapViewModel(this._allProductUseCase):super(ProductTapInitialState());
  //

Future<void> getProduct() async {
  try{
    emit(ProductTapLoadingState());
    var productList =await _allProductUseCase.invoke();
    emit(ProductTapSuccessState(productList: productList));
  }on AppExceptions catch(e){
    emit(ProductTapErrorState(errMessage: e.message));
  }
}

}