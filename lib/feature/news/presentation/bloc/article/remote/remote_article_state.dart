import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch/feature/news/domain/entities/article.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {

  final List<ArticleEntity> ? articles;
  final DioError ? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props {
    return [
      articles!,
      error!,
    ];
  }

}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioError error) : super(error: error);
}