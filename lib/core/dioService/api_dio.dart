import 'package:dio/dio.dart';

import '../constant/api_string_const.dart';

abstract class ApiDio {
  static final _dio = _getDio();
  static Dio get instance => _dio;
  static Dio _getDio() {
    final baseOptions = BaseOptions(
      baseUrl: ApiStringConst.BASE_URL,
    );
    return Dio(baseOptions);
  }
}
