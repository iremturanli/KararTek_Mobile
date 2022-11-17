// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';
import 'package:flutter_application_1/services/Registration/IRegistrationService.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
import '../ApiClient.dart';

class RegistrationService implements IRegistrationService {
  ApiClient? _apiClient;
  RegistrationService(ApiClient apiClient) {
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
  Future<UserLoginInformationResponse> userLogin(
      UserLoginInformation userLoginInformation) async {
    Response response =
        await _apiClient!.postRequest("Auth/login", userLoginInformation);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return UserLoginInformationResponse.fromJson(response.data);
  }

  @override
  Future<MobileApiResponse> userRegistration(
      UserRegisterInformation userRegisterInformation) async {
    // TODO: implement userRegistration
    Response response =
        await _apiClient!.postRequest("Auth/registe", userRegisterInformation);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return MobileApiResponse.fromJson(response.data);
  }
}
