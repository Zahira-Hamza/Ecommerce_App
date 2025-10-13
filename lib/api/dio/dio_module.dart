//!customize specific things to the object and make the injectable follow it
//! using the injectable while using retrofit will need using module (web services depend on a dio object which is not a direct class)
import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_endpoints.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  //!!!!why????
  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiEndpoints
          .baseUrl, //*using this will make us delete the baseUrl in the web services file
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger provideLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    );
  }

  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyLogger) {
    Dio dio = Dio(baseOptions);
    //todo:add dio interceptors
    dio.interceptors.add(prettyLogger);
    return dio;
  }

  @singleton
  @injectable
  WebServices provideWebServices(Dio dio) => WebServices(dio);
}
