// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/JudgmentStateDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/userTypeDropdownResponse.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';

import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
import '../IBaseService.dart';

abstract class ILawyerJudgmentStateDropdownService implements IBaseService {
  Future<JudgmentStateDropdownResponse> getJudgmentState();
}
