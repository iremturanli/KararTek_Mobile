// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentTypeRadioButtonResponse.dart';
import 'package:flutter_application_1/ApiResponse/forgotMyPasswordResponse.dart';
import 'package:flutter_application_1/models/ForgotMyPasswordInformation.dart/forgotMyPasswordInformation.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentInformation.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';
import 'package:flutter_application_1/services/JudgmentServices/IJudgmentService.dart';
import 'package:flutter_application_1/services/Registration/IRegistrationService.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
import '../ApiClient.dart';

class JudgmentService implements IJudgmentService {
  ApiClient? _apiClient;
  JudgmentService(ApiClient apiClient) {
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
  Future<JudgmentTypeInformationResponse> getJudgments(
      JudgmentInformation judgmentInformation) async {
    Response response = await _apiClient!
        .postRequest("Judgments/GetJudgmentByType", judgmentInformation);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return JudgmentTypeInformationResponse.fromJson(response.data);
  }
}
