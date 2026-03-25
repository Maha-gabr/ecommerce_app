import 'package:flutter/material.dart';
class MainErrorWidget extends StatelessWidget {
  final String errMessage;
  final VoidCallback? onTap;
  const MainErrorWidget({super.key, required this.errMessage,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errMessage,style:TextStyle(color:Colors.red ) ),
       onTap!=null ?
       ElevatedButton(onPressed: onTap, child: Text('Try Again'))
    : SizedBox.shrink(),
      ],
    );
  }
}
