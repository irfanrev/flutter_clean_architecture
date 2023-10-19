import 'package:flutter_clean_arch/feature/news/domain/usecase/get_article.dart';
import 'package:flutter_clean_arch/feature/news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_arch/feature/news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../core/resources/data_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase.call(null);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticleDone(dataState.data!),
      );
    }

    
    if (dataState is DataFailed) {
      emit(
        RemoteArticleError(dataState.error!)
      );
    }
  }

}