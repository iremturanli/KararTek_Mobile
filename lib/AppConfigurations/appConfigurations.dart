import 'package:get_it/get_it.dart';
import '../services/ApiClient.dart';
import '../services/Registration/RegistrationService.dart';

GetIt getIt = GetIt.instance;
void configureInjection() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<RegistrationService>(
      () => RegistrationService(getIt<ApiClient>()));
/*  getIt.registerLazySingleton<SchoolService>(
      () => SchoolService(getIt<ApiClient>()));
  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<ApiClient>())); */
  /*  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<ApiClient>())); */
}
