// ignore: file_names
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentTypeRadioButtonResponse.dart';

import '../IBaseService.dart';

abstract class IJudgmentTypeRadioButtonService implements IBaseService {
  Future<JudgmentTypeInformationResponse> getJudgmentTypes();
}
