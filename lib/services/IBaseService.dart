// ignore_for_file: file_names

import '../ApiResponse/mobileApiResponse.dart';

abstract class IBaseService {
  onResponseCallback(MobileApiResponse response);
  onErrorCallback(MobileApiResponse response);
}
