import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:news_api_practice/pages/Models/Article.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Article>? articles;
  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  NewsModel copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return NewsModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      status: map['status'],
      totalResults: map['totalResults'],
      articles:
          List<Article>.from(map['articles']?.map((x) => Article.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewsModel(status: $status, totalResults: $totalResults, articles: $articles)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsModel &&
        other.status == status &&
        other.totalResults == totalResults &&
        listEquals(other.articles, articles);
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}
