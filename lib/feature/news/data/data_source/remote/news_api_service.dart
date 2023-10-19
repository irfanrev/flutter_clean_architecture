
import 'package:flutter_clean_arch/core/utils/constant.dart';
import 'package:flutter_clean_arch/feature/news/data/model/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {

  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') String  ? newsAPIKey,
    @Query('country') String  ?  countryQuery,
    @Query('category') String  ? categoryQuery,
  });

}