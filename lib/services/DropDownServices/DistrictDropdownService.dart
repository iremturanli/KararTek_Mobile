import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/CourtDropdownResponse.dart';
import 'package:flutter_application_1/models/CommissionInformation/commissionInformation.dart';

import '../../ApiResponse/DistrictDropdownResponse.dart';
import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'IDistrictDropdownServices.dart';

class DistrictDropdownService implements IDistrictDropdownService {
  ApiClient? _apiClient;
  DistrictDropdownService(ApiClient apiClient) {
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
  Future<DistrictInformationResponse> getDistricts(int id) async {
    Map<String, dynamic> filterObject = {"id": id};
    Response response =
        await _apiClient!.getRequest("District/GetAll", filter: filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return DistrictInformationResponse.fromJson(response.data);
  }
}
