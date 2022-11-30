// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataResponse.dart';
import '../../models/JudgmentInformation/judgmentDtoInformation.dart';
import '../../models/LawyerJudgmentInformation/LawyerJudgmentDtoInformation.dart';
import '../IBaseService.dart';

abstract class ILawyerJudgmentService implements IBaseService {
  Future<SearchDataApiResponse> getLawyerJudgments(
      JudgmentDtoInformation judgmentDtoInformation);
  Future<BaseResponseApi> addLike(int id);
}
