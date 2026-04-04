import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/di.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_view_model.dart';
import 'package:ecommerce_app/features/main_layout/home/cubit/home_tap_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/main_layout/home/cubit/home_tap_view_model.dart';
import '../cashe/shared_prefs_utiles.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
 final bool? automaticallyImplyLeading;
 // final void Function(String)? onSearch ;
  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading,  });

  @override
  Widget build(BuildContext context) {
    int count = context.watch<CartViewModel>().numOfCartItem;
    final TextEditingController searchController = TextEditingController();
    // int? count = SharedPrefsUtils.getData(key: 'numOfCartItem') as int?;

    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading??false,
      title: SvgPicture.asset(
        SvgAssets.routeLogo,
        height: 25.h,
        width: 25.w,
        colorFilter:
            const ColorFilter.mode(ColorManager.textColor, BlendMode.srcIn),
      ),
      bottom: PreferredSize(
          preferredSize: const Size(AppSize.s100, AppSize.s60),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<HomeTapViewModel, HomeTapStates>(
                    bloc: getIt<HomeTapViewModel>()..getCategories()..getBrands(),
  builder: (context, state) {
    return TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    cursorColor: ColorManager.primary,
                    // onFieldSubmitted: onSearch,
                    style: getRegularStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: AppMargin.m12.w,
                          vertical: AppMargin.m8.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.error)),
                      prefixIcon: ImageIcon(
                        AssetImage(IconsAssets.icSearch),
                        color: ColorManager.primary,
                      ),
                      hintText: "what do you search for?",
                      hintStyle: getRegularStyle(
                          color: ColorManager.primary, fontSize: FontSize.s16),
                    ),
                  );
  },
),
                ),
                Badge(
                  label: Text('$count'),        // the number shown
                  isLabelVisible: (count??0) > 0,    // hide when 0
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  largeSize: 20,
                  offset: Offset(4, 1),
                  child: IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.cartRoute),
                      icon: ImageIcon(
                        AssetImage(IconsAssets.icCart),
                        color: ColorManager.primary,
                      )),
                )
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
