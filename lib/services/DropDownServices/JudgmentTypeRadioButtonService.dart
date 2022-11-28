import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/CourtDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentTypeRadioButtonResponse.dart';
import 'package:flutter_application_1/services/DropDownServices/IJudgmentTypeRadioButtonService.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'ICourtDropdownServices.dart';

class JudgmentTypeRadioButtonService
    implements IJudgmentTypeRadioButtonService {
  ApiClient? _apiClient;
  JudgmentTypeRadioButtonService(ApiClient apiClient) {
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
  Future<JudgmentTypeInformationResponse> getJudgmentTypes() async {
    Response response = await _apiClient!.getRequest("JudgmentTypes/GetAll");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return JudgmentTypeInformationResponse.fromJson(response.data);
  }
}
