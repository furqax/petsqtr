class AutoGenerate {
  AutoGenerate({
    required this.department,
  });
  late final List<Department> department;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    department = List.from(json['department'])
        .map((e) => Department.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['department'] = department.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Department {
  Department({
    required this.id,
    required this.nameEng,
    this.nameArb,
    required this.image,
    required this.orderby,
    required this.status,
    required this.customId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.category,
  });
  late final int id;
  late final String? nameEng;
  late final Null nameArb;
  late final String? image;
  late final int? orderby;
  late final int? status;
  late final String? customId;
  late final String? createdAt;
  late final String? updatedAt;
  late final Null deletedAt;
  late final List<Categories> category;

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEng = json['name_eng'];
    nameArb = null;
    image = json['image'];
    orderby = json['orderby'];
    status = json['status'];
    customId = json['custom_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    category =
        List.from(json['category']).map((e) => Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_eng'] = nameEng;
    _data['name_arb'] = nameArb;
    _data['image'] = image;
    _data['orderby'] = orderby;
    _data['status'] = status;
    _data['custom_id'] = customId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['category'] = category.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.departmentId,
    required this.orderby,
    required this.nameEng,
    this.nameArb,
    required this.image,
    required this.status,
    this.customId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.subcategory,
  });
  late final int id;
  late final int? departmentId;
  late final int? orderby;
  late final String? nameEng;
  late final Null nameArb;
  late final String? image;
  late final int? status;
  var customId;
  late final String? createdAt;
  late final String? updatedAt;
  late final Null deletedAt;
  late final List<Subcategory> subcategory;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    orderby = json['orderby'];
    nameEng = json['name_eng'];
    nameArb = null;
    image = json['image'];
    status = json['status'];
    customId = json['custom_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    subcategory = List.from(json['subcategory'])
        .map((e) => Subcategory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['department_id'] = departmentId;
    _data['orderby'] = orderby;
    _data['name_eng'] = nameEng;
    _data['name_arb'] = nameArb;
    _data['image'] = image;
    _data['status'] = status;
    _data['custom_id'] = customId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['subcategory'] = subcategory.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.categoryId,
    required this.departmentId,
    required this.orderby,
    required this.nameEng,
    this.nameArb,
    required this.image,
    required this.status,
    this.customId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final int? categoryId;
  late final int? departmentId;
  late final int? orderby;
  late final String? nameEng;
  late final Null nameArb;
  late final String? image;
  late final int? status;
  var customId;
  late final String? createdAt;
  late final String? updatedAt;
  late final Null deletedAt;

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    departmentId = json['department_id'];
    orderby = json['orderby'];
    nameEng = json['name_eng'];
    nameArb = null;
    image = json['image'];
    status = json['status'];
    customId = json['custom_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['department_id'] = departmentId;
    _data['orderby'] = orderby;
    _data['name_eng'] = nameEng;
    _data['name_arb'] = nameArb;
    _data['image'] = image;
    _data['status'] = status;
    _data['custom_id'] = customId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}

class Brand {
  Brand({
    required this.id,
    required this.nameEng,
    this.nameArb,
    required this.status,
    required this.orderby,
    required this.customId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String? nameEng;
  late final String? nameArb;
  late final int? status;
  late final int? orderby;
  late final String? customId;
  late final String? image;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? deletedAt;

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEng = json['name_eng'];
    nameArb = null;
    status = json['status'];
    orderby = json['orderby'];
    customId = json['custom_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_eng'] = nameEng;
    _data['name_arb'] = nameArb;
    _data['status'] = status;
    _data['orderby'] = orderby;
    _data['custom_id'] = customId;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}

class Slider {
  Slider({
    required this.id,
    required this.imgName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int? id;
  late final String? imgName;
  late final int? status;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? deletedAt;

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgName = json['img_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['img_name'] = imgName;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
