class MonsModel {
  int? itemID;
  String? custname;
  String? countstotal;
  String? fromto;
  String? dateCreated;
  String? note;

  MonsModel(
      {this.itemID,
      this.custname,
      this.countstotal,
      this.fromto,
      this.dateCreated,
      this.note});

  MonsModel.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    custname = json['custname'];
    countstotal = json['countstotal'];
    fromto = json['fromto'];
    dateCreated = json['date_created'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['custname'] = this.custname;
    data['countstotal'] = this.countstotal;
    data['fromto'] = this.fromto;
    data['date_created'] = this.dateCreated;
    data['note'] = this.note;
    return data;
  }
}