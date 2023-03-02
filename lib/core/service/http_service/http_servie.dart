import 'package:habilita_enem/core/service/http_service/http_service_interface.dart';
import 'package:http/http.dart' as http;

class HttpService implements IHttpService {
  final client = http.Client();

  @override
  Future<HttpResponse> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client
        .get(Uri.parse(url).replace(queryParameters: queryParameters));

    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
