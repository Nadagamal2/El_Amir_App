class Masrofat {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  Masrofat({this.records, this.record, this.code, this.status, this.message});

  Masrofat.fromJson(Map<String, dynamic> json) {
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
  int? total;
  int? recep;
  int? rest;
  int? id;
  int? foodExpCost;
  int? princePrincessExpCost;
  int? princFaisalPrincessesExpCost;
  int? laborersExpCost;
  int? medicalSuppliesExpCost;
  int? maintenanceContractsExpCost;
  int? buildingExpCost;
  int? carMaintenanceExpCost;
  int? hydrocarbonsExpCost;
  int? publicServicesExpCost;
  int? travelExpCost;
  int? salariesExpCost;
  int? gratuitiesExpCost;
  String? expDate;

  Records(
      {this.total,
        this.recep,
        this.rest,
        this.id,
        this.foodExpCost,
        this.princePrincessExpCost,
        this.princFaisalPrincessesExpCost,
        this.laborersExpCost,
        this.medicalSuppliesExpCost,
        this.maintenanceContractsExpCost,
        this.buildingExpCost,
        this.carMaintenanceExpCost,
        this.hydrocarbonsExpCost,
        this.publicServicesExpCost,
        this.travelExpCost,
        this.salariesExpCost,
        this.gratuitiesExpCost,
        this.expDate});

  Records.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    recep = json['recep'];
    rest = json['rest'];
    id = json['id'];
    foodExpCost = json['food_ExpCost'];
    princePrincessExpCost = json['prince_princess_ExpCost'];
    princFaisalPrincessesExpCost = json['princFaisal_princesses_ExpCost'];
    laborersExpCost = json['laborers_ExpCost'];
    medicalSuppliesExpCost = json['medical_supplies_ExpCost'];
    maintenanceContractsExpCost = json['maintenance_contracts_ExpCost'];
    buildingExpCost = json['building_ExpCost'];
    carMaintenanceExpCost = json['car_Maintenance_ExpCost'];
    hydrocarbonsExpCost = json['hydrocarbons_ExpCost'];
    publicServicesExpCost = json['public_services_ExpCost'];
    travelExpCost = json['travel_ExpCost'];
    salariesExpCost = json['salaries_ExpCost'];
    gratuitiesExpCost = json['gratuities_ExpCost'];
    expDate = json['expDate'];
  }

 }