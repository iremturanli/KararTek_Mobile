// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDtoInformation.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../../models/LawyerJudgmentInformation/lawyerJudgmentInformation.dart';
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
  Future<BaseResponseApi> addLike(int id) async {
    // ignore: todo
    // TODO: implement addLike
    Map<String, dynamic> filterObject = {"id": id};

    Response response =
        await _apiClient!.postById("Judgments/JudgmentToLike/" + id.toString());
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);

    return BaseResponseApi.fromJson(response.data);
  }

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
  Future<MobileApiResponse> addLawyerJudgment(
      LawyerJudgmentInformation lawyerJudgmentInformation) async {
    Response response = await _apiClient!.postRequest(
        "LawyerJudgment/AddLawyerJudgments", lawyerJudgmentInformation);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return MobileApiResponse.fromJson(response.data);
  }
}
