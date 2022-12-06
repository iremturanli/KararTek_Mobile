import 'package:flutter_application_1/services/DropDownServices/CityDropdownService.dart';

import 'package:flutter_application_1/services/DropDownServices/JudgmentTypeRadioButtonService.dart';
import 'package:flutter_application_1/services/DropDownServices/SearchTypeDropdownService.dart';
import 'package:flutter_application_1/services/DropDownServices/UserTypeDropdownServices.dart';
import 'package:flutter_application_1/services/JudgmentServices/judgmentService.dart';
import 'package:flutter_application_1/services/UserService/UserService.dart';
import 'package:get_it/get_it.dart';
import '../services/ApiClient.dart';
import '../services/DropDownServices/CityDropdownService.dart';
import '../services/DropDownServices/CommissionDropdownService.dart';
import '../services/DropDownServices/CourtDropdownService.dart';
import '../services/DropDownServices/DistrictDropdownService.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import '../services/Registration/RegistrationService.dart';

GetIt getIt = GetIt.instance;
void configureInjection() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<RegistrationService>(
      () => RegistrationService(getIt<ApiClient>()));
  getIt.registerLazySingleton<UserTypeDropDownService>(
      () => UserTypeDropDownService(getIt<ApiClient>()));
  getIt.registerLazySingleton<CityDropdownService>(
      () => CityDropdownService(getIt<ApiClient>()));
  getIt.registerLazySingleton<DistrictDropdownService>(
      () => DistrictDropdownService(getIt<ApiClient>()));
  getIt.registerLazySingleton<JudgmentTypeRadioButtonService>(
      () => JudgmentTypeRadioButtonService(getIt<ApiClient>()));

  getIt.registerLazySingleton<CommissionDropdownService>(
      () => CommissionDropdownService(getIt<ApiClient>()));
  getIt.registerLazySingleton<CourtDropdownService>(
      () => CourtDropdownService(getIt<ApiClient>()));
  getIt.registerLazySingleton<SearchTypeDropdownService>(
      () => SearchTypeDropdownService(getIt<ApiClient>()));
  getIt.registerLazySingleton<JudgmentService>(
      () => JudgmentService(getIt<ApiClient>()));
  getIt.registerLazySingleton<LawyerJudgmentService>(
      () => LawyerJudgmentService(getIt<ApiClient>()));
  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<ApiClient>()));

/*  getIt.registerLazySingleton<SchoolService>(
      () => SchoolService(getIt<ApiClient>()));
  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<ApiClient>())); */
  /*  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<ApiClient>())); */
}
