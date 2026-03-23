import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
class DioInterceptors extends Interceptor{
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppExceptions appExceptions ;
    final responseData = err.response?.data;
    String message = 'Some Thing Went Wrong';
    if(responseData is Map){
      message =responseData['errors']?['msg']?? responseData['message'] ?? message;
    }
 switch(err.type){
    case DioExceptionType.connectionTimeout:
     case DioExceptionType.sendTimeout:
     case DioExceptionType.receiveTimeout:
       case DioExceptionType.connectionError:
       appExceptions= NetworkException(message: 'Please check Your Internet Connection');
      break;
   case DioExceptionType.badResponse:
     appExceptions= NetworkException(
         statusCode: err.response?.statusCode,
         message: message);
 break;
   case DioExceptionType.cancel:
     appExceptions= NetworkException(message: 'Request Was Cancel');
   default :
     appExceptions= NetworkException(message: message);

 }
    handler.next(DioException(
        requestOptions: err.requestOptions,
      error:  appExceptions,
      response: err.response,
      type: err.type

    ));
  }

}