import 'package:dio/dio.dart';

abstract class IHttpService {
  Future get(String? url, {Options? options});
  Future post(String path, {dynamic data, Options? options});
  Future put(String path, {dynamic data, Options? options});
  Future delete(String url, {dynamic data, Options? options});
}
