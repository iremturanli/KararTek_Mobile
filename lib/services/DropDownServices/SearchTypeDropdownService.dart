import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/CourtDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchTypeDropdownResponse.dart';
import 'package:flutter_application_1/services/DropDownServices/ISearchTypeDropdownServices.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';
import 'ICourtDropdownServices.dart';

class SearchTypeDropdownService implements ISerachTypeDropdownService {
  ApiClient? _apiClient;
  SearchTypeDropdownService(ApiClient apiClient) {
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
  Future<SearchTypeInformationResponse> getSearchTypes() async {
    Response response = await _apiClient!.getRequest("SearchType/GetAll");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return SearchTypeInformationResponse.fromJson(response.data);
  }
}
