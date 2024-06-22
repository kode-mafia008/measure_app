part of global;
// import '../../global.dart';

class ApiResponse {
  bool status = false;
  Response? msg;
  ApiResponse({required this.status, this.msg});

  @override
  String toString() => 'Status: $status,  Msg: $msg';
}

abstract class ApiBaseModel {
  late Dio dio;

  _errorLogger(Map<String, dynamic>? variables, DioException? error) {
    String errorString = '''
    Variables: $variables
    Error: ${error!.error}
    Error Message: ${error.message}
    Status Code: ${error.response?.statusCode}
    Status Message: ${error.response?.statusMessage}
    ''';
    LoggerService.instance.errorLogger(errorString);
  }

  _successLogger(Map<String, dynamic>? variables, Response? response) {
    String errorString = '''
    Variables: $variables
    Status Code: ${response!.statusCode}
    Status Message: ${response.statusMessage}
    Response Data: ${response.data}
    ''';
    LoggerService.instance.infoLogger(errorString);
  }

  Future<ApiResponse> get(
      {required String url, Map<String, dynamic>? variables}) async {
    try {
      final Response response =
          await dio.get('${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url');
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> post(
      {required String url,
      FormData? formData,
      required Map<String, dynamic> variables}) async {
    try {
      final Response response = await dio.post(
          '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
          data: formData ?? json.encode(variables),);
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> patch(
      {required String url,
      FormData? formData,
      Map<String, dynamic>? variables}) async {
    try {
      final Response response = await dio.patch(
        '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
        data: formData ?? json.encode(variables),
      );
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> put(
      {required String url,
      FormData? formData,
      required Map<String, dynamic> variables}) async {
    try {
      final Response response = await dio.put(
        '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
        data: formData ?? json.encode(variables),
      );
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> delete(
      {required String url, Map<String, dynamic>? variables}) async {
    try {
      final Response response = await dio.delete(
        '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
        data: json.encode(variables),
      );
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }
}

class DioTokenInterceptor extends Interceptor {
  _infoLogger(RequestOptions options) {
    LoggerService.instance.infoLogger('''
    URL: ${options.path}
    METHOD: ${options.method}
    VALIDATE STATUS: ${options.validateStatus}

    Headers: ${options.headers}
    Follow Redirects: ${options.followRedirects}
    Extra: ${options.extra}
    List Format: ${options.listFormat}

    Query Parameters: ${options.queryParameters}
    ''');
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
  
    _infoLogger(options);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    return super.onError(error, handler);
  }
}










































// class CustomLogFilter extends LogFilter {
//   @override
//   bool shouldLog(LogEvent event) {
//     return kDebugMode;
//   }
// }


// class LoggerService {
//   static final LoggerService instance = LoggerService._();
//   factory LoggerService() => instance;
//   LoggerService._();

//   final Logger _logger = Logger(filter: CustomLogFilter());

//   errorLogger(String data) => _logger.e(data);

//   infoLogger(String data) => _logger.i(data);

//   debugLogger(String data) => _logger.d(data);
// }
// class ApiResponse {
//   bool status = false;
//   Response? msg;
//   Map<String, dynamic>? extra;

//   ApiResponse({required this.status, this.msg, this.extra});

//   @override
//   String toString() => 'Status: $status, Msg: $msg, Extra:$extra';

//   ApiResponse copyWith({
//     bool? status,
//     Response? msg,
//     Map<String, dynamic>? extra,
//   }) {
//     return ApiResponse(
//       status: status ?? this.status,
//       msg: msg ?? this.msg,
//       extra: extra ?? this.extra,
//     );
//   }
// }