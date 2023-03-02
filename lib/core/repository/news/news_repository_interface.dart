import 'package:habilita_enem/core/models/news_model.dart';

abstract class INewsRepository {
  Future<NewsModel> getNews();
}
