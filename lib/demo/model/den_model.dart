class DenModel {
  int? itemID;
  String? custname;
  String? dentotal;
  String? sdad;
  String? note;
  String? dateCreated;

  DenModel(
      {this.itemID,
      this.custname,
      this.dentotal,
      this.sdad,
      this.note,
      this.dateCreated});

  DenModel.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    custname = json['custname'];
    dentotal = json['dentotal'];
    sdad = json['sdad'];
    note = json['note'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['custname'] = this.custname;
    data['dentotal'] = this.dentotal;
    data['sdad'] = this.sdad;
    data['note'] = this.note;
    data['date_created'] = this.dateCreated;
    return data;
  }
}