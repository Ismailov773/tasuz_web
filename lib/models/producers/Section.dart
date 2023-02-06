class Section {
  int? id;
  String? name;
  String? nameuz;
  String? imagepath;


  Section({
      this.id, 
      this.name, 
      this.nameuz, 
      this.imagepath,});

  Section.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameuz = json['nameuz'];
    imagepath = json['imagepath'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameuz'] = nameuz;
    map['imagepath'] = imagepath;
    return map;
  }

}