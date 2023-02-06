import 'ModelSet.dart';

class Producer {
  int? id;
  String? name;
  String? imagepath;
  List<ModelSet>? modelSet;
  String? country;
  String? countryuz;
  String? active;



  Producer({
      this.id, 
      this.name, 
      this.imagepath, 
      this.modelSet, 
      this.country, 
      this.countryuz, 
      this.active,});

  Producer.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imagepath = json['imagepath'];
    if (json['modelSet'] != null) {
      modelSet = [];
      json['modelSet'].forEach((v) {
        modelSet?.add(ModelSet.fromJson(v));
      });
    }
    country = json['country'];
    countryuz = json['countryuz'];
    active = json['active'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['imagepath'] = imagepath;
    final modelSet = this.modelSet;
    if (modelSet != null) {
      map['modelSet'] = modelSet.map((v) => v.toJson()).toList();
    }
    map['country'] = country;
    map['countryuz'] = countryuz;
    map['active'] = active;
    return map;
  }

}