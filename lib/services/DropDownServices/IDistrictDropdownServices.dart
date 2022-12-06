import '../../ApiResponse/DistrictDropdownResponse.dart';
import '../IBaseService.dart';

abstract class IDistrictDropdownService implements IBaseService {
  Future<DistrictInformationResponse> getDistricts(int id);
}
