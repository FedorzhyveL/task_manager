import 'package:dio/dio.dart';
import 'package:task_manager/main.dart';

class BaseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(response);
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e(err);
    super.onError(err, handler);
  }
}
