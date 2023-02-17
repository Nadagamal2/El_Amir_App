class Comprehensive_examination {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  Comprehensive_examination(
      {this.records, this.record, this.code, this.status, this.message});

  Comprehensive_examination.fromJson(Map<String, dynamic> json) {
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
  Null? licensePhoto;
  Null? insurancesPhoto;
  int? id;
  String? carModel;
  Null? carColor;
  String? carNumbers;
  String? maintenanceTime;
  Null? carImgUrl;
  Null? licenseImgUrl;
  Null? insurancesImgUrl;

  Records(
      {this.photo,
        this.licensePhoto,
        this.insurancesPhoto,
        this.id,
        this.carModel,
        this.carColor,
        this.carNumbers,
        this.maintenanceTime,
        this.carImgUrl,
        this.licenseImgUrl,
        this.insurancesImgUrl});

  Records.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    licensePhoto = json['licensePhoto'];
    insurancesPhoto = json['insurancesPhoto'];
    id = json['id'];
    carModel = json['carModel'];
    carColor = json['carColor'];
    carNumbers = json['carNumbers'];
    maintenanceTime = json['maintenanceTime'];
    carImgUrl = json['carImgUrl'];
    licenseImgUrl = json['licenseImgUrl'];
    insurancesImgUrl = json['insurancesImgUrl'];
  }

 }