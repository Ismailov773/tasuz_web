class NewsItem {
  int? id;
  String? title;
  String? titleuz;
  String? description;
  String? descriptionuz;
  String? imagepath;
  String? date;

  // String active;

  NewsItem({
    this.id,
    this.title,
    this.titleuz,
    this.description,
    this.descriptionuz,
    this.imagepath,
    this.date,
    // required this.active,
  });

  NewsItem.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    titleuz = json['titleuz'];
    description = json['description'];
    descriptionuz = json['descriptionuz'];
    imagepath = json['imagepath'];
    date = json['date'];
    // active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['titleuz'] = titleuz;
    map['description'] = description;
    map['descriptionuz'] = descriptionuz;
    map['imagepath'] = imagepath;
    map['date'] = date;
    return map;
  }
}