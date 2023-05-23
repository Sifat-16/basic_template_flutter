import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class SoleResponse<T> extends BaseResponse {
  T data;

  SoleResponse({
    required int status,
    required String message,
    required this.data,
  }) : super(status: status, message: message);

  factory SoleResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    print(json["data"]);
    return SoleResponse<T>(
        status: json["status"],
        message: json["message"],
        data: create(json["data"]));
  }
}
