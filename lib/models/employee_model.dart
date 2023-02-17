class Employee {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  Employee({this.records, this.record, this.code, this.status, this.message});

  Employee.fromJson(Map<String, dynamic> json) {
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
  Null? employeePhoto;
  Null? signaturePhoto;
  int? id;
  String? name;
  String? employeeImgUrl;
  String? position;
  String? residencyUmber;
  String? residExpDate;
  String? signatureImgUrl;
  List<Missions>? missions;

  Records(
      {this.employeePhoto,
        this.signaturePhoto,
        this.id,
        this.name,
        this.employeeImgUrl,
        this.position,
        this.residencyUmber,
        this.residExpDate,
        this.signatureImgUrl,
        this.missions});

  Records.fromJson(Map<String, dynamic> json) {
    employeePhoto = json['employeePhoto'];
    signaturePhoto = json['signaturePhoto'];
    id = json['id'];
    name = json['name'];
    employeeImgUrl = json['employeeImgUrl'];
    position = json['position'];
    residencyUmber = json['residencyآumber'];
    residExpDate = json['resid_ExpDate'];
    signatureImgUrl = json['signatureImgUrl'];
    if (json['missions'] != null) {
      missions = <Missions>[];
      json['missions'].forEach((v) {
        missions!.add(new Missions.fromJson(v));
      });
    }
  }

 }

class Missions {
  int? id;
  String? missionDetails;
  String? missionTime;
  String? missionDate;
  String? place;
  int? empId;
  Null? employees;

  Missions(
      {this.id,
        this.missionDetails,
        this.missionTime,
        this.missionDate,
        this.place,
        this.empId,
        this.employees});

  Missions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    missionDetails = json['missionDetails'];
    missionTime = json['mission_time'];
    missionDate = json['missionDate'];
    place = json['place'];
    empId = json['empId'];
    employees = json['employees'];
  }

 }