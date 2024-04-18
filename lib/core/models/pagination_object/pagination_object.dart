import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
import 'meta.dart';

class PaginationObject<T> {
  @_Converter()
  List<T> data;
  Links links;
  Meta meta;

  PaginationObject({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory PaginationObject.fromJson(Map<String, dynamic> json) => PaginationObject<T>(
        data: (json['data'] as List<dynamic>).map(_Converter<T>().fromJson).toList(),
        links: Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  @override
  String toString() => 'PaginationObject(data: $data, links: $links, meta: $meta)';
}

interface class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    return json as T;
  }

  @override
  Object? toJson(T object) => object;
}
