class CustModel {
  int? custID;
  String? custname;
  String? phone;
  int? total;
  String? den;
  String? fromto;
  String? marks;
  String? rooms;

  CustModel(
      {this.custID,
      this.custname,
      this.phone,
      this.total,
      this.den,
      this.fromto,
      this.marks,
      this.rooms});

  CustModel.fromJson(Map<String, dynamic> json) {
    custID = json['custID'];
    custname = json['custname'];
    phone = json['phone'];
    total = json['total'];
    den = json['den'];
    fromto = json['fromto'];
    marks = json['marks'];
    rooms = json['rooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custID'] = this.custID;
    data['custname'] = this.custname;
    data['phone'] = this.phone;
    data['total'] = this.total;
    data['den'] = this.den;
    data['fromto'] = this.fromto;
    data['marks'] = this.marks;
    data['rooms'] = this.rooms;
    return data;
  }
}