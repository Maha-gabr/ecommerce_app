abstract class AppExceptions implements Exception{
  String message ;
  int? statusCode;
  AppExceptions({required this.message, this.statusCode});
}


class ServerException extends AppExceptions{

  ServerException({required super.message , super.statusCode});

}

class NetworkException extends AppExceptions{

  NetworkException({required super.message , super.statusCode});

}

class UnExpectedException extends AppExceptions{

  UnExpectedException({required super.message , super.statusCode});

}