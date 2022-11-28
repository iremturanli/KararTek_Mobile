// ignore: file_names
import 'package:flutter_application_1/ApiResponse/CityDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';

import '../IBaseService.dart';

abstract class ICommissionDropdownService implements IBaseService {
  Future<CommissionInformationResponse> getCommissions();
}
