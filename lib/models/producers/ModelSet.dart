import 'Section.dart';
import 'OptionSet.dart';

class ModelSet {
  int? id;
  String? name;
  double? price;
  double? priceuzs;
  String? producername;
  String? imagepath;
  String? description;
  String? descriptionuz;
  Section? section;
  List<OptionSet>? optionSet;
  String? active;



  ModelSet({
      this.id, 
      this.name, 
      this.price, 
      this.priceuzs, 
      this.producername, 
      this.imagepath, 
      this.description, 
      this.descriptionuz, 
      this.section, 
      this.optionSet, 
      this.active,});

  ModelSet.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    priceuzs = json['priceuzs'];
    producername = json['producername'];
    imagepath = json['imagepath'];
    description = json['description'];
    descriptionuz = json['descriptionuz'];
    section = json['section'] != null ? Section.fromJson(json['section']) : null;
    if (json['optionSet'] != null) {
      optionSet = [];
      json['optionSet'].forEach((v) {
        optionSet?.add(OptionSet.fromJson(v));
      });
    }
    active = json['active'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['priceuzs'] = priceuzs;
    map['producername'] = producername;
    map['imagepath'] = imagepath;
    map['description'] = description;
    map['descriptionuz'] = descriptionuz;
    final section = this.section;
    if (section != null) {
      map['section'] = section.toJson();
    }
    final optionSet = this.optionSet;
    if (optionSet != null) {
      map['optionSet'] = optionSet.map((v) => v.toJson()).toList();
    }
    map['active'] = active;
    return map;
  }

}