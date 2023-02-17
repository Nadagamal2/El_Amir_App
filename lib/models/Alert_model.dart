// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    required this.hosipitalRecords,
    required this.datesRecords,
    required this.carsRecords,
    required this.eventsRecords,
    required this.iSuccssed,
    required this.count,
    required this.code,
    required this.status,
    required this.message,
  });

  List<Record> hosipitalRecords;
  List<Record> datesRecords;
  List<CarsRecord> carsRecords;
  List<EventsRecord> eventsRecords;
  bool iSuccssed;
  int count;
  String code;
  String status;
  String message;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    hosipitalRecords: List<Record>.from(json["hosipitalRecords"].map((x) => Record.fromJson(x))),
    datesRecords: List<Record>.from(json["datesRecords"].map((x) => Record.fromJson(x))),
    carsRecords: List<CarsRecord>.from(json["carsRecords"].map((x) => CarsRecord.fromJson(x))),
    eventsRecords: List<EventsRecord>.from(json["eventsRecords"].map((x) => EventsRecord.fromJson(x))),
    iSuccssed: json["iSuccssed"],
    count: json["count"],
    code: json["code"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "hosipitalRecords": List<dynamic>.from(hosipitalRecords.map((x) => x.toJson())),
    "datesRecords": List<dynamic>.from(datesRecords.map((x) => x.toJson())),
    "carsRecords": List<dynamic>.from(carsRecords.map((x) => x.toJson())),
    "eventsRecords": List<dynamic>.from(eventsRecords.map((x) => x.toJson())),
    "iSuccssed": iSuccssed,
    "count": count,
    "code": code,
    "status": status,
    "message": message,
  };
}

class CarsRecord {
  CarsRecord({
    this.photo,
    this.licensePhoto,
    this.insurancesPhoto,
    required this.id,
    required this.carModel,
    this.carColor,
    required this.carNumbers,
    required this.maintenanceTime,
    this.carImgUrl,
    this.licenseImgUrl,
    this.insurancesImgUrl,
  });

  dynamic photo;
  dynamic licensePhoto;
  dynamic insurancesPhoto;
  int id;
  String carModel;
  dynamic carColor;
  String carNumbers;
  DateTime maintenanceTime;
  dynamic carImgUrl;
  dynamic licenseImgUrl;
  dynamic insurancesImgUrl;

  factory CarsRecord.fromJson(Map<String, dynamic> json) => CarsRecord(
    photo: json["photo"],
    licensePhoto: json["licensePhoto"],
    insurancesPhoto: json["insurancesPhoto"],
    id: json["id"],
    carModel: json["carModel"],
    carColor: json["carColor"],
    carNumbers: json["carNumbers"],
    maintenanceTime: DateTime.parse(json["maintenanceTime"]),
    carImgUrl: json["carImgUrl"],
    licenseImgUrl: json["licenseImgUrl"],
    insurancesImgUrl: json["insurancesImgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo,
    "licensePhoto": licensePhoto,
    "insurancesPhoto": insurancesPhoto,
    "id": id,
    "carModel": carModel,
    "carColor": carColor,
    "carNumbers": carNumbers,
    "maintenanceTime": maintenanceTime.toIso8601String(),
    "carImgUrl": carImgUrl,
    "licenseImgUrl": licenseImgUrl,
    "insurancesImgUrl": insurancesImgUrl,
  };
}

class Record {
  Record({
    required this.id,
    required this.dateDetails,
    required this.dateTime,
    required this.name,
    required this.place,
  });

  int id;
  String dateDetails;
  DateTime dateTime;
  String name;
  String place;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    dateDetails: json["dateDetails"],
    dateTime: DateTime.parse(json["date_Time"]),
    name: json["name"],
    place: json["place"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dateDetails": dateDetails,
    "date_Time": dateTime.toIso8601String(),
    "name": name,
    "place": place,
  };
}

class EventsRecord {
  EventsRecord({
    required this.id,
    required this.eventDate,
    required this.eventDetails,
  });

  int id;
  DateTime eventDate;
  String eventDetails;

  factory EventsRecord.fromJson(Map<String, dynamic> json) => EventsRecord(
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
