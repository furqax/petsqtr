class AutoGenerate {
  AutoGenerate({
    required this.success,
    required this.data,
    required this.error,
  });
  late final bool success;
  late final List<Privacy> data;
  late final bool error;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Privacy.fromJson(e)).toList();
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['error'] = error;
    return _data;
  }
}

class Privacy {
  Privacy({
    required this.id,
    required this.nameEng,
    required this.nameArb,
    required this.descriptionEng,
    required this.descriptionArb,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String nameEng;
  late final String nameArb;
  late final String descriptionEng;
  late final String descriptionArb;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  Privacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEng = json['name_eng'];
    nameArb = json['name_arb'];
    descriptionEng = json['description_eng'];
    descriptionArb = json['description_arb'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_eng'] = nameEng;
    _data['name_arb'] = nameArb;
    _data['description_eng'] = descriptionEng;
    _data['description_arb'] = descriptionArb;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
