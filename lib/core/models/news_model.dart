// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewsModel {
  final List<DataModel> data;
  NewsModel({
    required this.data,
  });

  NewsModel copyWith({
    List<DataModel>? data,
  }) {
    return NewsModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      data: List<DataModel>.from(
        map['data'].map<DataModel>(
          (x) => DataModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewsModel(data: $data)';

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class DataModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? source;
  final String? image;
  final String? category;
  final String? language;
  final String? country;
  final String? publishedAt;
  DataModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.source,
    this.image,
    this.category,
    this.language,
    this.country,
    this.publishedAt,
  });

  DataModel copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? source,
    String? image,
    String? category,
    String? language,
    String? country,
    String? publishedAt,
  }) {
    return DataModel(
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      source: source ?? this.source,
      image: image ?? this.image,
      category: category ?? this.category,
      language: language ?? this.language,
      country: country ?? this.country,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'source': source,
      'image': image,
      'category': category,
      'language': language,
      'country': country,
      'publishedAt': publishedAt,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      author: map['author'] != null ? map['author'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      publishedAt:
          map['publishedAt'] != null ? map['publishedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DataModel(author: $author, title: $title, description: $description, url: $url, source: $source, image: $image, category: $category, language: $language, country: $country, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.source == source &&
        other.image == image &&
        other.category == category &&
        other.language == language &&
        other.country == country &&
        other.publishedAt == publishedAt;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        title.hashCode ^
        description.hashCode ^
        url.hashCode ^
        source.hashCode ^
        image.hashCode ^
        category.hashCode ^
        language.hashCode ^
        country.hashCode ^
        publishedAt.hashCode;
  }
}
