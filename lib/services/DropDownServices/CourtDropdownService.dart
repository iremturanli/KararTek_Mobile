import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/CourtDropdownResponse.dart';
import 'package:flutter_application_1/models/CommissionInformation/commissionInformation.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'ICourtDropdownServices.dart';

class CourtDropdownService implements ICourtDropdownService {
  ApiClient? _apiClient;
  CourtDropdownService(ApiClient apiClient) {
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
  Future<CourtInformationResponse> getCourts(int id) async {
    Map<String, dynamic> filterObject = {"id": id};
    Response response =
        await _apiClient!.getRequest("Court/GetAll", filter: filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return CourtInformationResponse.fromJson(response.data);
  }
}
