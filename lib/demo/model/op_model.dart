class OPModel {
  int? itemID;
  String? custname;
  String? countsOp;
  String? inOut;
  String? rooms;
  String? marks;
  String? person;
  String? fromto;
  String? denCash;
  String? dateCreated;

  OPModel(
      {this.itemID,
      this.custname,
      this.countsOp,
      this.inOut,
      this.rooms,
      this.marks,
      this.person,
      this.fromto,
      this.denCash,
      this.dateCreated});

  OPModel.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    custname = json['custname'];
    countsOp = json['counts_op'];
    inOut = json['in_out'];
    rooms = json['rooms'];
    marks = json['marks'];
    person = json['person'];
    fromto = json['fromto'];
    denCash = json['den_cash'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['custname'] = this.custname;
    data['counts_op'] = this.countsOp;
    data['in_out'] = this.inOut;
    data['rooms'] = this.rooms;
    data['marks'] = this.marks;
    data['person'] = this.person;
    data['fromto'] = this.fromto;
    data['den_cash'] = this.denCash;
    data['date_created'] = this.dateCreated;
    return data;
  }
}