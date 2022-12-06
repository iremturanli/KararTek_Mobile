// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors, prefer_interpolation_to_compose_strings, override_on_non_overriding_member, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/ApiResponse/UserStatisticApiResponse.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/judgmentApprovalDto.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDtoInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentAddDto.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'ILawyerJudgmentService.dart';

class LawyerJudgmentService implements ILawyerJudgmentService {
  ApiClient? _apiClient;
  LawyerJudgmentService(ApiClient apiClient) {
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
  // Future<BaseResponseApi> addLike(int id) async {
  //   // ignore: todo
  // ignore: todo
  //   Map<String, dynamic> filterObject = {"id": id};

  //   Response response =
  //       await _apiClient!.postById("Judgments/JudgmentToLike/" + id.toString());
  //   if (response.statusCode == 401) {
  //     print("UnAuthorized");
  //   }
  //   print(response);

  //   return BaseResponseApi.fromJson(response.data);
  // }

  @override
  Future<SearchDataLawyerResponse> getLawyerJudgments(
      JudgmentDtoInformation judgmentDtoInformation) async {
    Response response = await _apiClient!.postRequest(
        "LawyerJudgment/GetLawyerJudgmentsByType", judgmentDtoInformation);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return SearchDataLawyerResponse.fromJson(response.data);
  }

  @override
  Future<SearchDataLawyerResponse> getAllLawyerJudgments() async {
    Response response =
        await _apiClient!.getRequest("LawyerJudgment/GetAllLawyerJudgments");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return SearchDataLawyerResponse.fromJson(response.data);
  }

  @override
  Future<SearchDataLawyerResponse> getLawyerJudgmentByUserId() async {
    Response response = await _apiClient!
        .getRequest("LawyerJudgment/GetLawyerJudgmentByUserId");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return SearchDataLawyerResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponseApi> addLawyerJudgmentLike(int id, bool check) async {
    Map<String, dynamic> filterObject = {"id": id.toString(), "check": check};
    Response response = await _apiClient!.postRequestQueryString(
        "LawyerJudgment/LawyerJudgmentToLike", filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);

    return BaseResponseApi.fromJson(response.data);
  }

  @override
  Future<MobileApiResponse> addLawyerJudgment(
      LawyerJudgmentAddDto lawyerJudgmentAddDto) async {
    Response response = await _apiClient!
        .postRequest("LawyerJudgment/AddLawyerJudgments", lawyerJudgmentAddDto);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return MobileApiResponse.fromJson(response.data);
  }

  @override
  Future<MobileApiResponse> approveJudgment(
      ApproveJudgmentDto approveJudgmentDto) async {
    Response response = await _apiClient!
        .postRequest("LawyerJudgment/Approval", approveJudgmentDto);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return MobileApiResponse.fromJson(response.data);
  }

  @override
  Future<UserStatisticApiResponse> getJudgmentsCount() async {
    Response response =
        await _apiClient!.getRequest("LawyerJudgment/GetJudgmentsCount");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return UserStatisticApiResponse.fromJson(response.data);
  }
}
