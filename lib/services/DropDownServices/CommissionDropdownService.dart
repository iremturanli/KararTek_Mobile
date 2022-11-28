import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'ICommissionDropdownService.dart';

class CommissionDropdownService implements ICommissionDropdownService {
  ApiClient? _apiClient;
  CommissionDropdownService(ApiClient apiClient) {
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
  Future<CommissionInformationResponse> getCommissions() async {
    Response response = await _apiClient!.getRequest("Commission/GetAll");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return CommissionInformationResponse.fromJson(response.data);
  }
}
