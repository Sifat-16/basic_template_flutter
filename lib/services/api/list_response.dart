import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> extends BaseResponse {
  List<T> data;
  PageMeta? meta;

  ListResponse(
      {required String message,
      required int status,
      required this.data,
      this.meta})
      : super(message: message, status: status);

  factory ListResponse.fromJson(
      Map<String, dynamic> res, Function(Map<String, dynamic>) create) {
    final data = <T>[];
    res['data'].forEach((v) => data.add(create(v)));

    final meta = res['meta'] == null ? null : PageMeta.fromJson(res['meta']);

    return ListResponse<T>(
        status: res["status"], message: res["message"], data: data, meta: meta);
  }
}

// To parse this JSON data, do
// final pageMeta = pageMetaFromJson(jsonString);
PageMeta pageMetaFromJson(String str) => PageMeta.fromJson(json.decode(str));
String pageMetaToJson(PageMeta data) => json.encode(data.toJson());

class PageMeta {
  PageMeta({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.from,
    required this.to,
    required this.path,
    this.links,
  });

  final int total;
  final int perPage;
  final int currentPage;
  final int lastPage;
  final int? from;
  final int? to;
  final String path;
  final List<Link>? links;

  factory PageMeta.fromJson(Map<String, dynamic> json) => PageMeta(
        total: json["total"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        from: json["from"],
        to: json["to"],
        path: json["path"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "current_page": currentPage,
        "last_page": lastPage,
        "from": from,
        "to": to,
        "path": path,
        "links": List<dynamic>.from(links?.map((x) => x.toJson()) ?? []),
      };
}

class Link {
  Link({
    this.url,
    this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
