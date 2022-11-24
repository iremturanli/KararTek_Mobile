// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/models/ForgotMyPasswordInformation.dart/forgotMyPasswordInformation.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';

import '../../apiResponse/userLoginInformationResponse.dart';
import '../../models/UserLoginInformation/userLoginInformation.dart';
import '../IBaseService.dart';

abstract class IRegistrationService implements IBaseService {
  Future<UserLoginInformationResponse> userLogin(
      UserLoginInformation userLoginInformation);

  Future<MobileApiResponse> userRegistration(
      UserRegisterInformation userRegisterInformation);

  Future<MobileApiResponse> forgotMyPassword(
      ForgotMyPasswordInformation forgotMyPasswordInformation);
}
