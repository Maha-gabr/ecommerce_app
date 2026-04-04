import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/main_error_widget.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/di.dart';
import '../../../home/cubit/home_tap_states.dart';
import '../../../home/cubit/home_tap_view_model.dart';
import 'category_item.dart';


//
// class CategoriesList extends StatefulWidget {
//   const CategoriesList({super.key});
//
//   @override
//   State<CategoriesList> createState() => _CategoriesListState();
// }
//
// class _CategoriesListState extends State<CategoriesList> {
//   // Index of the currently selected category_or_brand
//   int selectedIndex = 0;
//   var homeViewModel = getIt<HomeTapViewModel>();
//
// @override
//   void initState() {
//     super.initState();
//     homeViewModel.getCategories();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: Container(
//           decoration: BoxDecoration(
//             color: ColorManager.containerGray,
//             border: Border(
//               // set the border for only 3 sides
//                 top: BorderSide(
//                     width: AppSize.s2,
//                     color: ColorManager.primary.withOpacity(0.3)),
//                 left: BorderSide(
//                     width: AppSize.s2,
//                     color: ColorManager.primary.withOpacity(0.3)),
//                 bottom: BorderSide(
//                     width: AppSize.s2,
//                     color: ColorManager.primary.withOpacity(0.3))),
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(AppSize.s12),
//               bottomLeft: Radius.circular(AppSize.s12),
//             ),
//           ),
//
//           // the products items list
//           child: BlocBuilder<HomeTapViewModel, HomeTapStates>(
//             bloc: homeViewModel,
//             builder: (context, state) {
//               if(state is HomeTapErrorState){
//                 return MainErrorWidget(errMessage: state.errMessage);
//               }else if(state is HomeTapSuccessState){
//                 return ClipRRect(
//                   // clip the corners of the container that hold the list view
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(AppSize.s12),
//                     bottomLeft: Radius.circular(AppSize.s12),
//                   ),
//                   child: ListView.builder(
//                     itemCount: state.categoriesList?.length??1,
//                     itemBuilder: (context, index) =>
//                         CategoryItem(index,
//                             state.categoriesList?[index].name??"", selectedIndex == index,
//                             onItemClick),
//                   ),
//                 );
//
//               }else{
//                 return MainLoadingWidget();
//               }
//
//             },
//           ),
//         ));
//   }
//
//   // callback function to change the selected index
//   onItemClick(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
// }
