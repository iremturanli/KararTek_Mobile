// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/ApiResponse/UserLikeResponse.dart';
import 'package:flutter_application_1/ApiResponse/forgotMyPasswordResponse.dart';
import 'package:flutter_application_1/models/ForLikeInformation/forLikeDto.dart';
import 'package:flutter_application_1/models/ForgotMyPasswordInformation.dart/forgotMyPasswordInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';
import 'package:flutter_application_1/services/Registration/IRegistrationService.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
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
  Future<UserLikeResponse> userLike(int id, int searchTypeId) async {
    Map<String, dynamic> filterObject = {
      "id": id.toString(),
      "searchTypeId": searchTypeId
    };
    Response response =
        await _apiClient!.postRequest("UserLike/GetAll", filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return UserLikeResponse.fromJson(response.data);
  }
}
