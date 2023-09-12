class OPMll {
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

  OPMll(
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

  factory OPMll.fromMap(Map<String, dynamic> map) {
    return OPMll(
      itemID: map['itemID'],
      custname: map['custname'],
      countsOp: map['counts_op'],
      inOut: map['in_out'],
      rooms: map['rooms'],
      marks: map['marks'],
      person: map['person'],
      fromto: map['fromto'],
      denCash: map['den_cash'],
      dateCreated: map['date_created'],
    );
  }
}
