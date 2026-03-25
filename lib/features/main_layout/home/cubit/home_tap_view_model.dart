import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/domain/usecase/brands/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/cubit/home_tap_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecase/category/get_all_categories_use_case.dart';
@injectable
class HomeTapViewModel extends Cubit<HomeTapStates>{
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllBrandsUseCase _getAllBrandsUseCase;
  HomeTapSuccessState homeTapSuccessState = HomeTapSuccessState();

  HomeTapViewModel(this._getAllCategoriesUseCase, this._getAllBrandsUseCase):super(HomeTapInitialState())  ;
 void getCategories() async {
    try{
      emit(HomeTapLoadingState());
     var categoriesList =await _getAllCategoriesUseCase.invoke();
      emit(homeTapSuccessState= homeTapSuccessState.copyWith(categoriesList: categoriesList));
    }on AppExceptions catch(e){
      emit(HomeTapErrorState(errMessage: e.message));
    }
  }

  void getBrands() async {
    try{
      emit(HomeTapLoadingState());
      var brandsList =await _getAllBrandsUseCase.invoke();
      emit(homeTapSuccessState= homeTapSuccessState.copyWith(brandsList: brandsList));
    }on AppExceptions catch(e){
      emit(HomeTapErrorState(errMessage: e.message));
    }
  }


}