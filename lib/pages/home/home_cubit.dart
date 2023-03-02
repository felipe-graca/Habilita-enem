import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habilita_enem/core/repository/news/news_repository_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final INewsRepository newsRepository;

  HomeCubit(this.newsRepository) : super(const HomeState());

  void init() async {
    await newsRepository.getNews();
  }
}
