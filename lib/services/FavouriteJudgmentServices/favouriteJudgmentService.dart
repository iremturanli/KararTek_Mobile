// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_application_1/ApiResponse/UserLikeResponse.dart';
import 'package:flutter_application_1/services/FavouriteJudgmentServices/IFavouriteJudgmentService.dart';

import '../../ApiResponse/mobileApiResponse.dart';
import '../ApiClient.dart';

class FavouriteJudgmentService implements IFavouriteJudgmentService {
  ApiClient? _apiClient;
  FavouriteJudgmentService(ApiClient apiClient) {
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
  Future<MobileApiResponse> addJudgmentPool(
      int judgmentId, int searchTypeId) async {
    Map<String, dynamic>? filterObject = {
      "judgmentId": judgmentId,
      "searchTypeId": searchTypeId
    };
    Response response = await _apiClient!
        .postRequestQueryString("JudgmentPool/AddJudgmentPool", filterObject);
    if (response.statusCode == 401) {
      print("UnAuthorized");
    }
    print(response);
    return MobileApiResponse.fromJson(response.data);
  }
}
