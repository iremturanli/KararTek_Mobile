// ignore_for_file: file_names, avoid_print,prefer_typing_uninitialized_variables
import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../ApiResponse/mobileApiResponse.dart';
import 'LocalSharedPreferences/LocalSharedPreference.dart';

class ApiClient {
  Dio? _dio;

  //final _baseUrl = "https://192.168.10.111:45458/api/"; //baseurl; 10.0.2.2

  final _baseUrl = "https://192.168.10.90:45456/api/"; //baseurl; 10.0.2.2

  var onResponseCallback;
  var onErrorCallback;

  ApiClient() {
    _dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000, // 60 seconds,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json; charset=utf-8",
          "X-Requested-With": "XMLHttpRequest"
        }));

    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      return dioClient;
    };
    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio!.interceptors.add(InterceptorsWrapper(
      // onRequest: (options, requestInterceptorHandler) {
      //   TODO: // SharePreference Ekleneycek
      //   String token = LocalSharedPreference.getString(
      //       LocalSharedPreference.SHARED_MEM_KEY_DEVICE_TOKEN);
      //   if (token != "") {
      //     print("Bearer Token:" + token);
      //     options.headers["AUTH_TOKEN"] = options.headers["Authorization"] =
      //         "Bearer " + token; //Sending token with every request accept login
      //     return requestInterceptorHandler.next(options);
      //   } //else {
      //   return requestInterceptorHandler.next(options);
      //   //}
      // },
      onResponse: (response, responseInterceptorHandler) {
        print('onResponse:${response.statusCode}');
        return responseInterceptorHandler.next(response);
      },
      onError: (error, errorInterceptorHandler) {
        print(error);
        if (error.response!.statusCode != 401) {
          MobileApiResponse apiResponse = MobileApiResponse();
          apiResponse.errorMessage =
              error.response?.data["message"] ?? error.message;
          //         String message = error.response?.data["message"] ?? error.message;
          onErrorCallback(apiResponse);
        }
        if (error.response != null) {
          if (error.response!.statusCode == 400) {
            print("BadRequest");
          } else if (error.response!.statusCode == 404) {
            print("Not Found!");
          } else if (error.response!.statusCode == 401) {
            print("UnAuthorized!");
          }
        }
        return errorInterceptorHandler.next(error);
      },
    ));
  }

  Future<Response> getRequest(String endPoint,
      {Map<String, dynamic>? filter,
      Map<String, Object>? queryParameters}) async {
    Response response;
    _dio!.options.method = "GET";
    response = await _dio!.get(endPoint, queryParameters: filter);
    log("Get Dio Response: " + response.toString());
    //print("Get Dio Response:" + response.toString());
    return response;
  }

  Future<Response> postRequest(String endPoint, dynamic formData) async {
    Response response;
    _dio!.options.method = "POST";
    _dio!.options.followRedirects = true;
    response = await _dio!.post(endPoint, data: formData);
    log("Post Dio Response: " + response.toString());
    //  print("Post Dio Response: " + response.toString());
    return response;
  }

  Future<Response> postById(String endPoint) async {
    Response response;
    _dio!.options.method = "POST";
    _dio!.options.followRedirects = true;
    response = await _dio!.post(endPoint);
    log("Post Dio Response: " + response.toString());
    //  print("Post Dio Response: " + response.toString());
    return response;
  }

  Future<Response> postRequestQueryString(
      String endPoint, dynamic formData) async {
    Response response;
    _dio!.options.method = "POST";
    response =
        await _dio!.post('$endPoint?${Transformer.urlEncodeMap(formData)}');
    print("Post Dio Response QueryString: " + response.toString());

    return response;
  }

  Future<Response> getRequestToken(String endpoint) async {
    Response response;
    _dio!.options.method = "GET";
    response = await _dio!.get(endpoint);
    print("Get Dio Response: " + response.toString());
    return response;
  }
}
