import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/CityDropdownResponse.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'ICityDropdownServices.dart';

class CityDropdownService implements ICityDropdownServices {
  ApiClient? _apiClient;
  CityDropdownService(ApiClient apiClient) {
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
  Future<CityInformationResponse> getCities() async {
    // TODO: implement userRegistration
    Response response = await _apiClient!.getRequest("City/GetAll");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return CityInformationResponse.fromJson(response.data);
  }
}
