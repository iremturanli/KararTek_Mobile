// ignore: file_names

import '../../ApiResponse/CourtDropdownResponse.dart';
import '../IBaseService.dart';

abstract class ICourtDropdownService implements IBaseService {
  Future<CourtInformationResponse> getCourts();
}
