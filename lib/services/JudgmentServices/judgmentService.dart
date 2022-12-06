// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDtoInformation.dart';
import 'package:flutter_application_1/services/JudgmentServices/IJudgmentService.dart';

import '../../ApiResponse/mobileApiResponse.dart';
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
  Future<SearchDataLawyerResponse> getJudgments(
      JudgmentDtoInformation judgmentDtoInformation) async {
    Response response = await _apiClient!
        .postRequest("Judgments/GetJudgmentByType", judgmentDtoInformation);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return SearchDataLawyerResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponseApi> addLike(int id, bool check) async {
    Map<String, dynamic> filterObject = {"id": id.toString(), "check": check};
    Response response = await _apiClient!
        .postRequestQueryString("Judgments/JudgmentToLike", filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);

    return BaseResponseApi.fromJson(response.data);
  }
}
