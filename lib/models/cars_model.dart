class Cars {
  List<Records>? records;
  Null record;
  String? code;
  String? status;
  String? message;

  Cars({this.records, this.record, this.code, this.status, this.message});

  Cars.fromJson(Map<String, dynamic> json) {
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
  Null photo;
  Null licensePhoto;
  Null insurancesPhoto;
  int? id;
  String? carModel;
  String? carColor;
  String? carNumbers;
  String? maintenanceTime;
  String? carImgUrl;
  String? licenseImgUrl;
  String? insurancesImgUrl;

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