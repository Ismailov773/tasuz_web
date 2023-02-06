import 'OptionConstant.dart';

class OptionSet {
  int? id;
  OptionConstant? optionConstant;
  String? optionname;
  String? active;

  OptionSet({
    this.id,
    this.optionConstant,
    this.optionname,
    this.active,
  });

  OptionSet.fromJson(dynamic json) {
    id = json['id'];
    optionConstant = json['optionConstant'] != null
        ? OptionConstant.fromJson(json['optionConstant'])
        : null;
    optionname = json['optionname'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    final optionConstant = this.optionConstant;
    if (optionConstant != null) {
      map['optionConstant'] = optionConstant.toJson();
    }
    map['optionname'] = optionname;
    map['active'] = active;
    return map;
  }
}
