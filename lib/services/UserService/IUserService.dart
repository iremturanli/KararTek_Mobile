// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/UserInformationResponse.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import '../IBaseService.dart';

abstract class IUserService implements IBaseService {
  Future<UserInformationResponse> getUserById();
}
