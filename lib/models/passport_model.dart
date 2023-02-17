class passport {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  passport({this.records, this.record, this.code, this.status, this.message});

  passport.fromJson(Map<String, dynamic> json) {
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
  String? passNumber;
  String? passImgUrl;

  Records({this.photo, this.id, this.passNumber, this.passImgUrl});

  Records.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    id = json['id'];
    passNumber = json['passNumber'];
    passImgUrl = json['passImgUrl'];
  }

 }