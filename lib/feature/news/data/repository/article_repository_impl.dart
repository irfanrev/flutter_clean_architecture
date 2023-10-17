import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/feature/news/data/model/article.dart';
import 'package:flutter_clean_arch/feature/news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {


  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }

}