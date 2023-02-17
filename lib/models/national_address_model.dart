class national_address {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  national_address(
      {this.records, this.record, this.code, this.status, this.message});

  national_address.fromJson(Map<String, dynamic> json) {
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
  Null? photo;
  int? id;
  String? natImgUrl;
  String? natNumber;

  Records({this.photo, this.id, this.natImgUrl, this.natNumber});

  Records.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    id = json['id'];
    natImgUrl = json['natImgUrl'];
    natNumber = json['natNumber'];
  }

 }