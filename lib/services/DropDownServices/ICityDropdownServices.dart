import 'package:flutter_application_1/ApiResponse/CityDropdownResponse.dart';

import '../../ApiResponse/CityDropdownResponse.dart';
import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
import '../IBaseService.dart';

abstract class ICityDropdownServices implements IBaseService {
  Future<CityInformationResponse> getCities();
}
