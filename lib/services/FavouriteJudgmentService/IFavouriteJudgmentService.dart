// ignore_for_file: file_names,constant_identifier_names, prefer_const_constructors

import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';

import '../../ApiResponse/BaseApiResponse.dart';
import '../../ApiResponse/JudgmentPoolApiResponse.dart';
import '../../ApiResponse/JudgmentPoolResponse.dart';
import '../IBaseService.dart';

abstract class IFavouriteJudgmentService implements IBaseService {
  Future<MobileApiResponse> addJudgmentPool(int judgmentId, int searchTypeId);
  Future<JudgmentPoolResponse> getAll();
  Future<MobileApiResponse> deleteFromJudgmentPool(int id, int searchTypeId);
}
