import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/userTypeDropdownResponse.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';
import 'package:flutter_application_1/services/Registration/IRegistrationService.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
import '../ApiClient.dart';
import 'IUserTypeDropdownServices.dart';

class UserTypeDropDownService implements IUserTypeDropdownServices {
  ApiClient? _apiClient;
  UserTypeDropDownService(ApiClient apiClient) {
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
  Future<UserTypeInformationResponse> getUserTypes() async {
    // TODO: implement userRegistration
    Response response = await _apiClient!.getRequest("UserTypes/GetAll");
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return UserTypeInformationResponse.fromJson(response.data);
  }
}
