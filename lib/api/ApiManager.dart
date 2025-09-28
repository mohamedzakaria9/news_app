import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/api/ApiConstants.dart';
import 'package:new_app/api/EndPoints.dart';
import 'package:new_app/models/NewsResponse.dart';
import '../models/SourceResponse.dart';

class ApiManager {
  //this function is to get the sources
  static Future<SourceResponse> getSources() async{
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      "apiKey": ApiConstants.apiKey,
    });
    try{
      var response = await http.get(url);
      return SourceResponse.fromJson(jsonDecode(response.body));
    }catch (e){
      throw e;
    }
  }
  //this function is to get the news by source id
  static Future<NewsResponse> getNewsBySourceId(
      String sourceId, {
        int page = 1,
        int pageSize = 10,
      }) async{
    // Ensure pageSize doesn't exceed the maximum allowed (100)
    int validPageSize = pageSize > 100 ? 100 : pageSize;

    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
      "page": page.toString(),
      "pageSize": validPageSize.toString(),
    });

    try{
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  ///page: _page,
//         pageSize: _pageSize,
}
