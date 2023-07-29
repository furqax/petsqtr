class AutoGenerate {
  AutoGenerate({
    required this.products,
  });
  late final List<Products> products;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['products'] = products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.title,
    this.bodyHtml,
    required this.vendor,
    required this.productType,
    required this.createdAt,
    required this.handle,
    required this.updatedAt,
    required this.publishedAt,
    this.templateSuffix,
    required this.status,
    required this.publishedScope,
    required this.tags,
    required this.adminGraphqlApiId,
    required this.options,
    required this.images,
    required this.image,
  });
  late final int id;
  late final String title;
  late final String? bodyHtml;
  late final String vendor;
  late final String productType;
  late final String createdAt;
  late final String handle;
  late final String updatedAt;
  late final String publishedAt;
  late final String? templateSuffix;
  late final String status;
  late final String publishedScope;
  late final String tags;
  late final String adminGraphqlApiId;
  late final List<Options> options;
  late final List<Images> images;
  late final Image image;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bodyHtml = null;
    vendor = json['vendor'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    handle = json['handle'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = null;
    status = json['status'];
    publishedScope = json['published_scope'];
    tags = json['tags'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    options =
        List.from(json['options']).map((e) => Options.fromJson(e)).toList();
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    image = Image.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['body_html'] = bodyHtml;
    _data['vendor'] = vendor;
    _data['product_type'] = productType;
    _data['created_at'] = createdAt;
    _data['handle'] = handle;
    _data['updated_at'] = updatedAt;
    _data['published_at'] = publishedAt;
    _data['template_suffix'] = templateSuffix;
    _data['status'] = status;
    _data['published_scope'] = publishedScope;
    _data['tags'] = tags;
    _data['admin_graphql_api_id'] = adminGraphqlApiId;
    _data['options'] = options.map((e) => e.toJson()).toList();
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['image'] = image.toJson();
    return _data;
  }
}

class Options {
  Options({
    required this.id,
    required this.productId,
    required this.name,
    required this.position,
  });
  late final int id;
  late final int productId;
  late final String name;
  late final int position;

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['name'] = name;
    _data['position'] = position;
    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.productId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    this.alt,
    required this.width,
    required this.height,
    required this.src,
    required this.variantIds,
    required this.adminGraphqlApiId,
  });
  late final int id;
  late final int productId;
  late final int position;
  late final String createdAt;
  late final String updatedAt;
  late final Null alt;
  late final int width;
  late final int height;
  late final String src;
  late final List<int> variantIds;
  late final String adminGraphqlApiId;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = null;
    width = json['width'];
    height = json['height'];
    src = json['src'];
    variantIds = List.castFrom<dynamic, int>(json['variant_ids']);
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['position'] = position;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['alt'] = alt;
    _data['width'] = width;
    _data['height'] = height;
    _data['src'] = src;
    _data['variant_ids'] = variantIds;
    _data['admin_graphql_api_id'] = adminGraphqlApiId;
    return _data;
  }
}

class Image {
  Image({
    required this.id,
    required this.productId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    this.alt,
    required this.width,
    required this.height,
    required this.src,
    required this.variantIds,
    required this.adminGraphqlApiId,
  });
  late final int id;
  late final int productId;
  late final int position;
  late final String createdAt;
  late final String updatedAt;
  late final Null alt;
  late final int width;
  late final int height;
  late final String src;
  late final List<int> variantIds;
  late final String adminGraphqlApiId;

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = null;
    width = json['width'];
    height = json['height'];
    src = json['src'];
    variantIds = List.castFrom<dynamic, int>(json['variant_ids']);
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['position'] = position;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['alt'] = alt;
    _data['width'] = width;
    _data['height'] = height;
    _data['src'] = src;
    _data['variant_ids'] = variantIds;
    _data['admin_graphql_api_id'] = adminGraphqlApiId;
    return _data;
  }
}
