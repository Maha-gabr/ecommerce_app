import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/domain/usecase/brands/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/cubit/home_tap_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/category_or_brand/response/common/category_or_brand.dart';
import '../../../../domain/usecase/category_or_brand/get_all_categories_use_case.dart';
@injectable
class HomeTapViewModel extends Cubit<HomeTapStates>{
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllBrandsUseCase _getAllBrandsUseCase;
  HomeTapSuccessState homeTapSuccessState = HomeTapSuccessState();

  HomeTapViewModel(this._getAllCategoriesUseCase, this._getAllBrandsUseCase):super(HomeTapInitialState())  ;
  late List<CategoryOrBrand>? categoriesList;
  late List<CategoryOrBrand>? brandsList;
//
  void searchCategory(String value){
    categoriesList = categoriesList?.where((element) =>element.name!.toLowerCase().startsWith(value.toLowerCase())).toList();
  }
  //
  void searchBrand(String value){
    brandsList = brandsList?.where((element) =>element.name!.toLowerCase().startsWith(value.toLowerCase())).toList();

  }
 void getCategories() async {
    try{
      emit(HomeTapLoadingState());
      categoriesList =await _getAllCategoriesUseCase.invoke();
      emit(homeTapSuccessState= homeTapSuccessState.copyWith(categoriesList: categoriesList));
    }on AppExceptions catch(e){
      emit(HomeTapErrorState(errMessage: e.message));
    }
  }

  void getBrands() async {
    try{
      emit(HomeTapLoadingState());
       brandsList =await _getAllBrandsUseCase.invoke();
      emit(homeTapSuccessState= homeTapSuccessState.copyWith(brandsList: brandsList));
    }on AppExceptions catch(e){
      emit(HomeTapErrorState(errMessage: e.message));
    }
  }


}