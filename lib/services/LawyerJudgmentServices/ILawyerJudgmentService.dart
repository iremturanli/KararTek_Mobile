// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentInformation.dart';
import '../../models/JudgmentInformation/judgmentDtoInformation.dart';
import '../IBaseService.dart';

abstract class ILawyerJudgmentService implements IBaseService {
  Future<SearchDataLawyerResponse> getLawyerJudgments(
      JudgmentDtoInformation judgmentDtoInformation);
  Future<BaseResponseApi> addLawyerJudgmentLike(int id, bool check);
  Future<SearchDataLawyerResponse> getAllLawyerJudgments();
  Future<SearchDataLawyerResponse> getLawyerJudgmentByUserId();
  Future<MobileApiResponse> addLawyerJudgment(
      LawyerJudgmentInformation lawyerJudgmentInformation);
}
