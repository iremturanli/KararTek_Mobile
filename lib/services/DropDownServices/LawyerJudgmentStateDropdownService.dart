import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentStateDropdownResponse.dart';
import 'package:flutter_application_1/models/JudgmentStateInformation/judgmentStateInformation.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'ICommissionDropdownService.dart';
import 'ILawyerJudgmentStateDropdownService.dart';

class LawyerJudgmentStateDropdownService
    implements ILawyerJudgmentStateDropdownService {
  ApiClient? _apiClient;
  LawyerJudgmentStateDropdownService(ApiClient apiClient) {
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
  Future<JudgmentStateDropdownResponse> getJudgmentState() async {
    Response response =
        await _apiClient!.getRequest("LawyerJudgmentState/GetAll");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return JudgmentStateDropdownResponse.fromJson(response.data);
  }
}
