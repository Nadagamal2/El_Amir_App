class identity {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  identity({this.records, this.record, this.code, this.status, this.message});

  identity.fromJson(Map<String, dynamic> json) {
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
  String? identityImgUrl;
  String? identityNumber;

  Records({this.photo, this.id, this.identityImgUrl, this.identityNumber});

  Records.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    id = json['id'];
    identityImgUrl = json['identityImgUrl'];
    identityNumber = json['identityNumber'];
  }


}