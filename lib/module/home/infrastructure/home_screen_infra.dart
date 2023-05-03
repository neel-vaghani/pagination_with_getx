import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pagination_with_getx/core/constant/api_string_const.dart';
import 'package:pagination_with_getx/core/dioService/api_dio.dart';

import '../model/posts_data_model.dart';

abstract class HomeScreenInfra {
  // GET POST DATA
  static Future<Either<List<PostsDataModel>, String?>> getPostsData({
    required int getDataFrom,
    required int dataLengthLimit,
  }) async {
    try {
      final res = await ApiDio.instance.get(
        ApiStringConst.GET_POST,
        queryParameters: {
          "_limit": dataLengthLimit,
          "_start": getDataFrom,
        },
      );
      final response = postsDataModelFromJson(
        jsonEncode(res.data),
      );
      return Left(response);
    } on DioError catch (e, str) {
      return Right(e.toString());
    }
  }
}
