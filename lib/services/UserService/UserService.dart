// ignore: file_names
import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/UserChangePasswordInformationResponse.dart';
import 'package:flutter_application_1/ApiResponse/UserInformationResponse.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';

import '../ApiClient.dart';
import 'IUserService.dart';

class UserService implements IUserService {
  ApiClient? _apiClient;
  UserService(ApiClient apiClient) {
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
  Future<UserInformationResponse> getUserById() async {
    Response response = await _apiClient!.getRequest("User/GetUserInformation");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return UserInformationResponse.fromJson(response.data);
  }

  @override
  Future<UserChangePasswordInformationResponse> changePassword(
      String? currentPassword, String? newPassword) async {
    Map<String, dynamic> filterObject = {
      "currentPassword": currentPassword,
      "newPassword": newPassword
    };
    Response response =
        await _apiClient!.postRequest("User/ChangePassword", filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return UserChangePasswordInformationResponse.fromJson(response.data);
  }
}
