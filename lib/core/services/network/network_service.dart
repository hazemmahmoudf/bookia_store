import 'package:bookia/core/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkService {
  static Dio ?_dio;

  static Dio get dio {
    
    _dio ??= Dio(
        BaseOptions(
            baseUrl: ApiConstants.urlBase,
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            receiveTimeout: const Duration(seconds: 30),
            connectTimeout: const Duration(seconds: 30)
        )
    );


// customization
    _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    )
    );
    return _dio!;
  }


}