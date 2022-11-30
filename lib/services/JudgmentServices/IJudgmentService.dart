// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentTypeRadioButtonResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataResponse.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDtoInformation.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentInformation.dart';

import '../IBaseService.dart';

abstract class IJudgmentService implements IBaseService {
  Future<SearchDataApiResponse> getJudgments(
      JudgmentDtoInformation judgmentDtoInformation);
  Future<BaseResponseApi> addLike(int id, bool check);
}
