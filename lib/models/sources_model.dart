class SourcesModel {
  SourcesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });
  late final String? id;
  late final String? name;
  late final String? description;
  late final String? url;
  late final String? category;
  late final String? language;
  late final String? country;

  SourcesModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }


}
