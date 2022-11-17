import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:habilita_enem/core/service/http/http_service_interface.dart';

class HttpService implements IHttpService {
  final String databasePath;

  HttpService(this.databasePath);

  late final _interceptorCache = DioCacheInterceptor(
    options: CacheOptions(
      store: HiveCacheStore(databasePath),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 30),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    ),
  );

  final _interceptorAuth = InterceptorsWrapper(
    onError: (err, handler) {
      if (err.response?.statusCode == 401) {}
      return handler.next(err);
    },
  );

  late final Dio _dio = Dio()
    ..interceptors.add(_interceptorCache)
    ..interceptors.add(_interceptorAuth);

  @override
  Future get(String? url, {Options? options}) async {
    final response = await _dio.get(url!, options: options);

    return response;
  }

  @override
  Future post(String path, {dynamic data, Options? options}) async {
    final response = await _dio.post(path, data: data, options: options);
    return response;
  }

  @override
  Future put(String path, {dynamic data, Options? options}) async {
    final response = await _dio.put(path, data: data, options: options);
    return response;
  }

  @override
  Future delete(String path, {dynamic data, Options? options}) async {
    final response = await _dio.delete(path, data: data, options: options);
    return response;
  }
}
