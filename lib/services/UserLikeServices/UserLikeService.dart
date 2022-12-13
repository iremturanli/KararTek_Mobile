// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/UserLikeResponse.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'IUserLikeService.dart';

class UserLikeService implements IUserLikeService {
  ApiClient? _apiClient;
  UserLikeService(ApiClient apiClient) {
    _apiClient = apiClient;
    _apiClient!.onResponseCallback = onResponseCallback;
    _apiClient!.onErrorCallback = onErrorCallback;
  }

  @override
  onErrorCallback(MobileApiResponse response) {
    print("Response Error:" + response.errorMessage!);
  }

  @override
  onResponseCallback(MobileApiResponse response) {
    print("Response Status:" + response.hasError.toString());
  }

  @override
  Future<UserLikeResponse> userLike(int searchTypeId) async {
    Map<String, dynamic>? filterObject = {"searchTypeId": searchTypeId};
    Response response = await _apiClient!
        .postRequestQueryString("UserLike/GetAll", filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return UserLikeResponse.fromJson(response.data);
  }
}
