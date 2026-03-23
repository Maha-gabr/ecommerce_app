import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/api_services.dart';
import 'package:ecommerce_app/api/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dio_interceptores.dart';

@module
abstract class GitItModule {
@singleton
BaseOptions get provideBaseOptions => BaseOptions(
  baseUrl:  EndPoints.baseUrl,
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);

@singleton
 PrettyDioLogger get providePrettyDioLogger => PrettyDioLogger(
   request: true,
   error: true,
   requestHeader: true,
   requestBody: true,
   responseBody: true,
  responseHeader: true
 );

@singleton
  Dio get provideDio{
  var dio = Dio(
      provideBaseOptions
  );
  dio.interceptors.add(DioInterceptors());
  dio.interceptors.add(providePrettyDioLogger);
  return dio;
}

@singleton
  ApiServices get provideApiServices => ApiServices(provideDio);

}