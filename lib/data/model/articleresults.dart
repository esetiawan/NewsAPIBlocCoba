// To parse this JSON data, do
//
//     final articleResults = articleResultsFromJson(jsonString);

import 'dart:convert';

import 'article.dart';
ArticleResults articleResultsFromJson(String str) => ArticleResults.fromJson(json.decode(str));

String articleResultsToJson(ArticleResults data) => json.encode(data.toJson());

class ArticleResults {
  ArticleResults({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory ArticleResults.fromJson(Map<String, dynamic> json) => ArticleResults(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x)).where(
        (article)=> article.author!=null&&article.urlToImage!=null&&article.publishedAt!=null&&article.content!=null
    )),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}



