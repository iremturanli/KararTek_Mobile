// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
import '../IBaseService.dart';

abstract class IRegistrationService implements IBaseService {
  Future<UserLoginInformationResponse> userLogin(
      UserLoginInformation userLoginInformation);
}