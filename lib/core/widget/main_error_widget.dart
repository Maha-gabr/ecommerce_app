import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
class MainErrorWidget extends StatelessWidget {
  final String errMessage;
  final VoidCallback? onTap;
  const MainErrorWidget({super.key, required this.errMessage,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(errMessage,style:TextStyle(color:ColorManager.primary ) ),
         onTap!=null ?
         ElevatedButton(onPressed: onTap, child: Text('Try Again',style: TextStyle(color: ColorManager.black),))
      : SizedBox.shrink(),
        ],
      ),
    );
  }
}
