import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
    bool isClicked;
   HeartButton({super.key, required this.onTap, required this.isClicked});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  // String heartIcon = IconsAssets.icHeart;
  // bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 25,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () {
        // setState(() {
        //   widget.isClicked = widget.!isClicked;
        //   heartIcon =
        //       !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
        //   widget.onTap?.call();
        // });
        widget.onTap?.call();

      },
      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon(
              
              AssetImage(
                  widget.isClicked ? IconsAssets.icClickedHeart : IconsAssets.icHeart,
                  // heartIcon
              ),
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
