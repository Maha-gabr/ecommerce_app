import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/domain/entities/category_or_brand/response/common/category_or_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  final CategoryOrBrand categoryItem;
  const CustomCategoryWidget({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 90,
          width: 90,
          fit: BoxFit.cover,
          imageUrl: categoryItem.image??'',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
/////////////////////////////////////////////
//         ClipRRect(
//           borderRadius: BorderRadius.circular(100.r),
//           child: Container(
//             height: 100.h,
//             width: 100.w,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//             ),
//             child: Image.asset(
//               ImageAssets.categoryHomeImage,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
        SizedBox(height: 8.h),
        Text(
    categoryItem.name??"",
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
