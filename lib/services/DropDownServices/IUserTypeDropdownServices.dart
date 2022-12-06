// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/userTypeDropdownResponse.dart';

import '../IBaseService.dart';

abstract class IUserTypeDropdownServices implements IBaseService {
  Future<UserTypeInformationResponse> getUserTypes();
}
