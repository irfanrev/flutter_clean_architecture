import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/feature/news/domain/entities/article.dart';

abstract class ArticleRepository {
  
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

}