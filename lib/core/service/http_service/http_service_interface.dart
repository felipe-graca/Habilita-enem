abstract class IHttpService {
  Future<HttpResponse> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  });
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, required this.statusCode});
}
