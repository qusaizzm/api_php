class RoomModel {
  int? roID;
  String? name;
  int? total;
  String? stock;
  String? fromto;

  RoomModel({this.roID, this.name, this.total, this.stock, this.fromto});

  RoomModel.fromJson(Map<String, dynamic> json) {
    roID = json['roID'];
    name = json['name'];
    total = json['total'];
    stock = json['stock'];
    fromto = json['fromto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roID'] = this.roID;
    data['name'] = this.name;
    data['total'] = this.total;
    data['stock'] = this.stock;
    data['fromto'] = this.fromto;
    return data;
  }
}