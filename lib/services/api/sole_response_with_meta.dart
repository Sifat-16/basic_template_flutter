import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class SoleResponseWithMeta<T, K> extends BaseResponse {
  T data;
  K meta;

  SoleResponseWithMeta({
    required int status,
    required String message,
    required this.data,
    required this.meta,
  }) : super(status: status, message: message);

  factory SoleResponseWithMeta.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) createT,
    Function(Map<String, dynamic>) createK,
  ) {

    return SoleResponseWithMeta<T, K>(
      status: json["status"],
      message: json["message"],
      data: createT(json["data"]),
      meta: createK(json['meta']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
        'meta': meta,
      };
}
