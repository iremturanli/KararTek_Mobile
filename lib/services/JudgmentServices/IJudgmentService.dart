// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/JudgmentTypeRadioButtonResponse.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentInformation.dart';

import '../IBaseService.dart';

abstract class IJudgmentService implements IBaseService {
  Future<JudgmentTypeInformationResponse> getJudgments(
      JudgmentInformation judgmentInformation);
}
