import 'package:ecommerce_app/core/cashe/shared_prefs_utiles.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resources/di.dart';
import 'core/routes_manager/route_generator.dart';
import 'features/main_layout/products/cubit/product_tap_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPrefsUtils.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var token = SharedPrefsUtils.getData(key: 'token') as String?;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartViewModel>()),
        BlocProvider(create: (context) => getIt<ProductTapViewModel>())

    ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              home: child,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: token != null ?
              Routes.mainRoute
                  : Routes.signInRoute,
              // initialRoute: Routes.signInRoute,
            ),
      ),
    );
  }
}
