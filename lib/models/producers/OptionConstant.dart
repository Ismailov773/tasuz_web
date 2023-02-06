class OptionConstant {
  int? id;
  String? namerus;
  String? nameuz;
  String? active;


  OptionConstant({
      this.id, 
      this.namerus, 
      this.nameuz, 
      this.active,});

  OptionConstant.fromJson(dynamic json) {
    id = json['id'];
    namerus = json['namerus'];
    nameuz = json['nameuz'];
    active = json['active'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['namerus'] = namerus;
    map['nameuz'] = nameuz;
    map['active'] = active;
    return map;
  }

}