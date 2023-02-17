class Mission {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  Mission({this.records, this.record, this.code, this.status, this.message});

  Mission.fromJson(Map<String, dynamic> json) {
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
  String? missionDetails;
  String? missionTime;
  String? missionDate;
  String? place;
  int? empId;
  Employees? employees;

  Records(
      {this.id,
        this.missionDetails,
        this.missionTime,
        this.missionDate,
        this.place,
        this.empId,
        this.employees});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    missionDetails = json['missionDetails'];
    missionTime = json['mission_time'];
    missionDate = json['missionDate'];
    place = json['place'];
    empId = json['empId'];
    employees = json['employees'] != null
        ? new Employees.fromJson(json['employees'])
        : null;
  }

 }

class Employees {
  int? id;
  String? name;
  String? employeeImgUrl;
  String? position;
  String? residencyUmber;
  String? residExpDate;
  String? signatureImgUrl;
  Null? missions;

  Employees(
      {this.id,
        this.name,
        this.employeeImgUrl,
        this.position,
        this.residencyUmber,
        this.residExpDate,
        this.signatureImgUrl,
        this.missions});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    employeeImgUrl = json['employeeImgUrl'];
    position = json['position'];
    residencyUmber = json['residencyآumber'];
    residExpDate = json['resid_ExpDate'];
    signatureImgUrl = json['signatureImgUrl'];
    missions = json['missions'];
  }

 }