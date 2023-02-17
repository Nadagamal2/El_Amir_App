class Another_Dates {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  Another_Dates(
      {this.records, this.record, this.code, this.status, this.message});

  Another_Dates.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? dateDetails;
  String? dateTime;
  String? name;
  String? place;

  Records({this.id, this.dateDetails, this.dateTime, this.name, this.place});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateDetails = json['dateDetails'];
    dateTime = json['date_Time'];
    name = json['name'];
    place = json['place'];
  }

 }