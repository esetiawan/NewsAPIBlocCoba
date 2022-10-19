import 'dart:convert';

import '../model/articleresults.dart';
import 'package:http/http.dart' as http;
import '../model/articleresults.dart';

class ApiService {
  static const String url="https://newsapi.org/v2/";
  static const String apiKey="381f9fcbce53437a9fd719403f8e0f4e";


  Future<ArticleResults> topHeadlines(String country,String category) async {
    //http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=381f9fcbce53437a9fd719403f8e0f4e
    //final response = await http.get(Uri.parse("${url}top-headlines?country=${country}&category=${category}&apiKey=${apiKey}"));
    final response = await http.get(Uri.parse("http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=381f9fcbce53437a9fd719403f8e0f4e"));
    if (response.statusCode==200)
    {
      return ArticleResults.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from Newsapi');
    }
  }


  Future<ArticleResults> searchHeadlines(String date,String query) async {
    //https://newsapi.org/v2/everything?q=tesla&from=2022-09-19&sortBy=publishedAt&apiKey=381f9fcbce53437a9fd719403f8e0f4e
    final response = await http.get(Uri.parse("${url}everything?q=${query}&sortBy=publishedAt&from=${date}&apiKey=${apiKey}"));
    if (response.statusCode==200)
    {
      return ArticleResults.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from Newsapi');
    }
  }
}