import 'package:flutter_application_1/services/DropDownServices/CityDropdownServices.dart';
import 'package:flutter_application_1/services/DropDownServices/UserTypeDropdownServices.dart';
import 'package:get_it/get_it.dart';
import '../services/ApiClient.dart';
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
/*  getIt.registerLazySingleton<SchoolService>(
      () => SchoolService(getIt<ApiClient>()));
  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<ApiClient>())); */
  /*  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<ApiClient>())); */
}
