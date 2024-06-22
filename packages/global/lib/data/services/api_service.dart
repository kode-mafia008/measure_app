part of global;

class ApiModel extends ApiBaseModel {
  static final ApiModel instance = ApiModel._();
  factory ApiModel() => instance;
  ApiModel._() {
    dio = Dio();
    dio.interceptors.add(DioTokenInterceptor());
  }
}

// class ApiCommonServicesModel extends ApiBaseModel {
//   static final ApiCommonServicesModel instance = ApiCommonServicesModel._();
//   factory ApiCommonServicesModel() => instance;
//   ApiCommonServicesModel._() {
//     dio = Dio();
//     dio.interceptors.add(DioTokenInterceptor());
//   }
// }
