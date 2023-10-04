// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

CancellationReasonList temperaturesFromJson(String str) =>
    CancellationReasonList.fromJson(json.decode(str));

String temperaturesToJson(CancellationReasonList data) =>
    json.encode(data.toJson());

class CancellationReasonList {
  bool? success;
  String? type;
  String? message;
  List<Datum>? data;

  CancellationReasonList({
    this.success,
    this.type,
    this.message,
    this.data,
  });

  factory CancellationReasonList.fromJson(Map<String, dynamic> json) =>
      CancellationReasonList(
        success: json["success"],
        type: json["type"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "type": type,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? reason;

  Datum({
    this.reason,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}
