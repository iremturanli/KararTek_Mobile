// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/UserLikeResponse.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/models/ForLikeInformation/forLikeDto.dart';

import '../../ApiResponse/SearchDataLawyerResponse.dart';
import '../IBaseService.dart';

abstract class IFavouriteJudgmentService implements IBaseService {
  Future<MobileApiResponse> addJudgmentPool(int judgmentId, int searchTypeId);
}
