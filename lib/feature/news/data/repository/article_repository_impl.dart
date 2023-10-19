import 'dart:io';

import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/feature/news/data/data_source/remote/news_api_service.dart';
import 'package:flutter_clean_arch/feature/news/data/model/article.dart';
import 'package:flutter_clean_arch/feature/news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/constant.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        newsAPIKey: newsAPIKey,
        countryQuery: countryQuery,
        categoryQuery: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
