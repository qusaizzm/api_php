class FromtoModel {
  int? itemID;
  String? dateWork;
  int? selected;

  FromtoModel({this.itemID, this.dateWork, this.selected});

  FromtoModel.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    dateWork = json['date_work'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['date_work'] = this.dateWork;
    data['selected'] = this.selected;
    return data;
  }
}