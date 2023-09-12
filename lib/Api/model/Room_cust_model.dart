class RoomCustMl {
  int? itemID;
  String? room_no;
  String? custname;
  String? fromto;
  String? dateCreated;

  RoomCustMl({
    this.itemID,
    this.room_no,
    this.custname,
    this.fromto,
    this.dateCreated,
  });

  factory RoomCustMl.fromMap(Map<String, dynamic> json) {
    return RoomCustMl(
      itemID: json['itemID'],
      room_no: json['room_no'],
      custname: json['custname'],
      fromto: json['fromto'],
      dateCreated: json['dateCreated'],
    );
  }
  RoomCustMl.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    room_no = json['room_no'];
    custname = json['custname'];
    fromto = json['fromto'];
    dateCreated = json['dateCreated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['room_no'] = this.room_no;
    data['custname'] = this.custname;
    data['fromto'] = this.fromto;
    data['dateCreated'] = this.dateCreated;
    return data;
  }
}
