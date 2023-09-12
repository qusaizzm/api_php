class RoomMl {
  int? roID;
  String? name_no;
  int? total;
  String? stock;
  String? fromto;

  RoomMl({this.roID, this.name_no, this.total, this.stock, this.fromto});

  factory RoomMl.fromMap(Map<String, dynamic> json) {
    return RoomMl(
      roID: json['roID'],
      name_no: json['name_no'],
      total: json['total'],
      stock: json['stock'],
      fromto: json['fromto'],
    );
  }
  RoomMl.fromJson(Map<String, dynamic> json) {
    roID = json['roID'];
    name_no = json['name_no'];
    total = json['total'];
    stock = json['stock'];
    fromto = json['fromto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roID'] = this.roID;
    data['name_no'] = this.name_no;
    data['total'] = this.total;
    data['stock'] = this.stock;
    data['fromto'] = this.fromto;
    return data;
  }
}
