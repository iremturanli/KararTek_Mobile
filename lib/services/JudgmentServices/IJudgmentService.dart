// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDetailSearchDtoInformation.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDtoInformation.dart';

import '../IBaseService.dart';

abstract class IJudgmentService implements IBaseService {
  Future<SearchDataLawyerResponse> getJudgments(
      JudgmentDtoInformation judgmentDtoInformation);
  Future<BaseResponseApi> addLike(int id, bool check);

  Future<SearchDataLawyerResponse> getJudgmentsbyDetailSearch(
      JudgmentDetailSearchDto judgmentDetailSearchDto);
}
