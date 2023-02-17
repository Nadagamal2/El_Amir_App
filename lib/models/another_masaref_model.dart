class Another_masafef {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  Another_masafef(
      {this.records, this.record, this.code, this.status, this.message});

  Another_masafef.fromJson(Map<String, dynamic> json) {
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
  int? cost;
  String? deatils;
  String? otherExpensesDate;

  Records({this.id, this.cost, this.deatils, this.otherExpensesDate});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'];
    deatils = json['deatils'];
    otherExpensesDate = json['other_ExpensesDate'];
  }

 }