import 'package:hasura_connect/hasura_connect.dart';
import '../../global.dart' as global;
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class HasuraResponse {
  bool status = false;
  Map<String, dynamic> msg = {};

  HasuraResponse({required this.status, required this.msg});

  @override
  String toString() => 'Status: $status, Msg: $msg';
}

abstract class HasuraBaseModel {
  late HasuraConnect hasuraConnect;

  _errorLogger(String doc, Map<String, dynamic>? variables, Object? error) {
    _getHeaders().then((value) {
      String errorString = '''
    URL: ${hasuraConnect.url}
    Headers: $value

    Query: $doc
    Variables: $variables

    Error: $error
    ''';
      LoggerService.instance.errorLogger(errorString);
      
    });
  }

  Future<HasuraResponse> query(
      {required String doc, Map<String, dynamic>? variables}) async {
    try {
      final response = await hasuraConnect.query(doc, variables: variables);
      return HasuraResponse(status: true, msg: response['data']);
    } catch (error) {
      _errorLogger(doc, variables, error);
      return HasuraResponse(status: false, msg: {'error': error});
    }
  }

  Future<HasuraResponse> mutation(
      {required String doc, required Map<String, dynamic> variables}) async {
    try {
      final Map<String, dynamic> response =
          await hasuraConnect.mutation(doc, variables: variables);
      return HasuraResponse(status: true, msg: response['data']);
    } catch (error) {
      _errorLogger(doc, variables, error);
      return HasuraResponse(status: false, msg: {'error': error});
    }
  }

  Future<Snapshot> subscription(
      {required String doc, Map<String, dynamic>? variables}) async {
    return await hasuraConnect.subscription(doc, variables: variables);
  }
}

class TokenInterceptor extends Interceptor {
  TokenInterceptor({this.applicationID});

  final String? applicationID;

  _infoLogger(Request request) {
    LoggerService.instance.infoLogger('''
    URL: ${request.url}
    Headers: ${request.headers}
    
    Type: ${request.type}
    Query: ${request.query}
    ''');
  }

  @override
  Future<void> onConnected(HasuraConnect connect) async {}

  @override
  Future<void> onDisconnected() async {}

  @override
  Future onError(HasuraError request, HasuraConnect connect) async {}

  @override
  Future<Request> onRequest(Request request, HasuraConnect connect) async {
    request.headers.addAll(await _getHeaders());
    _infoLogger(request);
    return request;
  }

  @override
  Future onResponse(Response data, HasuraConnect connect) async {
    return data;
  }

  @override
  Future<void> onSubscription(Request request, Snapshot snapshot) async {}

  @override
  Future<void> onTryAgain(HasuraConnect connect) async {}
}

class AdminInterceptor extends Interceptor {
  AdminInterceptor({this.applicationID});

  final String? applicationID;

  _infoLogger(Request request) {
    LoggerService.instance.infoLogger('''
    URL: ${request.url}
    Headers: ${request.headers}
    
    Type: ${request.type}
    Query: ${request.query}
    ''');
  }

  @override
  Future<void> onConnected(HasuraConnect connect) async {}

  @override
  Future<void> onDisconnected() async {}

  @override
  Future onError(HasuraError request, HasuraConnect connect) async {}

  @override
  Future<Request> onRequest(Request request, HasuraConnect connect) async {
    _infoLogger(request);
    return request;
  }

  @override
  Future onResponse(Response data, HasuraConnect connect) async {
    return data;
  }

  @override
  Future<void> onSubscription(Request request, Snapshot snapshot) async {}

  @override
  Future<void> onTryAgain(HasuraConnect connect) async {}
}

Future<Map<String, String>> _getHeaders() async {
  final token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiaHR0cHM6Ly9oYXN1cmEuaW8vand0L2NsYWltcyI6eyJ4LWhhc3VyYS1hbGxvd2VkLXJvbGVzIjpbInVzZXIiLCJ2aWV3ZXIiXSwieC1oYXN1cmEtZGVmYXVsdC1yb2xlIjoidXNlciIsIngtaGFzdXJhLXVzZXItaWQiOiJlZTI1OGUzOC0xMmQyLTRiNDgtODc3MC00MzA2NzgyMDEzZjMifSwiaWF0IjoxNzE3MDYxNDc3LCJleHAiOjE3MTc2NjYyNzd9.Ny49syFr4dFCBbbujvSSPx-iwbc1IPC0G6qdwW0PaOk";

  Map<String, String> headers = {
    'Accept': 'application/json',
    "Content-Type": "application/json",
    "Connection": "keep-alive",
  };
  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  } else {
    headers['x-hasura-admin-secret'] = "UePCDbLCJgTHTsoK";
  }

  print(headers.toString());
  return headers;
}


class CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return kDebugMode;
  }
}

class LoggerService {
  static final LoggerService instance = LoggerService._();
  factory LoggerService() => instance;
  LoggerService._();

  final Logger _logger = Logger(filter: CustomLogFilter());

  errorLogger(String data) => _logger.e(data);

  infoLogger(String data) => _logger.i(data);

  debugLogger(String data) => _logger.d(data);
}


