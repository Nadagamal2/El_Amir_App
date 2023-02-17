// To parse this JSON data, do
//
//     final monasabatModel = monasabatModelFromJson(jsonString);

import 'dart:convert';

MonasabatModel monasabatModelFromJson(String str) => MonasabatModel.fromJson(json.decode(str));

String monasabatModelToJson(MonasabatModel data) => json.encode(data.toJson());

class MonasabatModel {
  MonasabatModel({
    required this.records,
    this.record,
    required this.code,
    required this.status,
    required this.message,
  });

  List<Record> records;
  dynamic record;
  String code;
  String status;
  String message;

  factory MonasabatModel.fromJson(Map<String, dynamic> json) => MonasabatModel(
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    record: json["record"],
    code: json["code"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
    "record": record,
    "code": code,
    "status": status,
    "message": message,
  };
}

class Record {
  Record({
    required this.id,
    required this.eventDate,
    required this.eventDetails,
  });

  int id;
  DateTime eventDate;
  String eventDetails;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    eventDate: DateTime.parse(json["event_date"]),
    eventDetails: json["event_Details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_date": eventDate.toIso8601String(),
    "event_Details": eventDetails,
  };
}
