import 'package:habilita_enem/core/helpers/helpers.dart';
import 'package:habilita_enem/core/models/news_model.dart';
import 'package:habilita_enem/core/repository/news/news_repository_interface.dart';
import 'package:habilita_enem/core/service/http_service/http_service_interface.dart';

class NewsRepository implements INewsRepository {
  final IHttpService httpService;

  NewsRepository(this.httpService);

  @override
  Future<NewsModel> getNews() async {
    final result = await httpService.get(
      url: 'http://api.mediastack.com/v1/news',
      queryParameters: {
        'access_key': Helpers.newsApiKey,
        'keywords': 'educação',
        'countries': 'br',
        'limit': '10',
      },
    );

    return NewsModel.fromJson(result.data);
  }
}
