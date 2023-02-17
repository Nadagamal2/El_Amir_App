class hewalat {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  hewalat({this.records, this.record, this.code, this.status, this.message});

  hewalat.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    record = json['record'];
    code = json['code'];
    status = json['status'];
    message = json['message'];
  }

 }

class Records {
  List<Remlist>? remlist;
  int? total;
  int? lastRest;
  int? totalPlusLastRest;

  Records({this.remlist, this.total, this.lastRest, this.totalPlusLastRest});

  Records.fromJson(Map<String, dynamic> json) {
    if (json['remlist'] != null) {
      remlist = <Remlist>[];
      json['remlist'].forEach((v) {
        remlist!.add(new Remlist.fromJson(v));
      });
    }
    total = json['total'];
    lastRest = json['lastRest'];
    totalPlusLastRest = json['totalPlus_LastRest'];
  }

 }

class Remlist {
  int? day;
  int? month;
  int? id;
  String? remDate;
  int? remCost;
  String? remDeatils;
  String? remType;

  Remlist(
      {this.day,
        this.month,
        this.id,
        this.remDate,
        this.remCost,
        this.remDeatils,
        this.remType});

  Remlist.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    id = json['id'];
    remDate = json['remDate'];
    remCost = json['remCost'];
    remDeatils = json['remDeatils'];
    remType = json['remType'];
  }

 }