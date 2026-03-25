import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
class MainLoadingWidget extends StatelessWidget {
  const MainLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorManager.primary,
      ),
    );
  }
}
