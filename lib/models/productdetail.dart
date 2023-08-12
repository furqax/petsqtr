class AutoGenerate {
  AutoGenerate({
    required this.product,
  });
  late final ProductDetail product;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    product = ProductDetail.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product'] = product.toJson();
    return _data;
  }
}

class ProductDetail {
  ProductDetail(
      {required this.id,
      required this.title,
      required this.bodyHtml,
      required this.vendor,
      required this.productType,
      required this.createdAt,
      required this.handle,
      required this.updatedAt,
      required this.publishedAt,
      required this.templateSuffix,
      required this.status,
      required this.publishedScope,
      required this.tags,
      required this.adminGraphqlApiId,
      required this.variants,
      required this.options,
      required this.images,
      required this.image,
      this.quantity});
  late final int? id;
  late final String? title;
  late final String? bodyHtml;
  late final String? vendor;
  late final String? productType;
  late final String? createdAt;
  late final String? handle;
  late final String? updatedAt;
  late final String? publishedAt;
  late final String? templateSuffix;
  late final String? status;
  // late final int? quantity;

  late final String? publishedScope;
  late final String? tags;
  late final String? adminGraphqlApiId;
  late final List<Variants>? variants;
  late final List<Quantity>? quantity;

  late final List<Options> options;
  late final List<Images> images;
  late final Image image;

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bodyHtml = json['body_html'];
    vendor = json['vendor'];
    quantity = json['quantity'];

    productType = json['product_type'];
    createdAt = json['created_at'];
    handle = json['handle'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = json['template_suffix'];
    status = json['status'];
    publishedScope = json['published_scope'];
    tags = json['tags'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    variants =
        //json['product']['variants'] == null
        //     ? []
        //     :
        List.from(json['variants']).map((e) => Variants.fromJson(e)).toList();

    options =
        List.from(json['options']).map((e) => Options.fromJson(e)).toList();
    // quantity = json['product']['quantity'] == null
    //     ? []
    //     : List.from(json['quantity']).map((e) => Quantity.fromJson(e)).toList();
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
    _data['variants'] = variants!.map((e) => e.toJson()).toList();
    _data['quantity'] = quantity!.map((e) => e.toJson()).toList();

    _data['options'] = options!.map((e) => e.toJson()).toList();
    _data['images'] = images!.map((e) => e.toJson()).toList();
    _data['image'] = image.toJson();
    return _data;
  }
}

class Variants {
  Variants({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.sku,
    required this.position,
    required this.inventoryPolicy,
    required this.compareAtPrice,
    required this.fulfillmentService,
    required this.inventoryManagement,
    required this.option1,
    this.option2,
    this.option3,
    required this.createdAt,
    required this.updatedAt,
    required this.taxable,
    required this.barcode,
    required this.grams,
    this.imageId,
    required this.weight,
    required this.weightUnit,
    required this.inventoryItemId,
    required this.inventoryQuantity,
    required this.oldInventoryQuantity,
    required this.requiresShipping,
    required this.adminGraphqlApiId,
  });
  late final int? id;
  late final int? productId;
  late final String? title;
  late final String? price;
  late final String? sku;
  late final int? position;
  late final String? inventoryPolicy;
  late final String? compareAtPrice;
  late final String? fulfillmentService;
  late final String? inventoryManagement;
  late final String? option1;
  late final String? option2;
  late final String? option3;
  late final String? createdAt;
  late final String? updatedAt;
  late final bool? taxable;
  late final String? barcode;
  late final int? grams;
  var imageId;
  var weight;
  late final String? weightUnit;
  late final int? inventoryItemId;
  late final int? inventoryQuantity;
  late final int? oldInventoryQuantity;
  late final bool? requiresShipping;
  late final String? adminGraphqlApiId;

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
    position = json['position'];
    inventoryPolicy = json['inventory_policy'];
    compareAtPrice = json['compare_at_price'];
    fulfillmentService = json['fulfillment_service'];
    inventoryManagement = json['inventory_management'];
    option1 = json['option1'];
    option2 = null;
    option3 = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxable = json['taxable'];
    barcode = json['barcode'];
    grams = json['grams'];
    imageId = json['image_id'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inventoryItemId = json['inventory_item_id'];
    inventoryQuantity = json['inventory_quantity'];
    oldInventoryQuantity = json['old_inventory_quantity'];
    requiresShipping = json['requires_shipping'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['title'] = title;
    _data['price'] = price;
    _data['sku'] = sku;
    _data['position'] = position;
    _data['inventory_policy'] = inventoryPolicy;
    _data['compare_at_price'] = compareAtPrice;
    _data['fulfillment_service'] = fulfillmentService;
    _data['inventory_management'] = inventoryManagement;
    _data['option1'] = option1;
    _data['option2'] = option2;
    _data['option3'] = option3;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['taxable'] = taxable;
    _data['barcode'] = barcode;
    _data['grams'] = grams;
    _data['image_id'] = imageId;
    _data['weight'] = weight;
    _data['weight_unit'] = weightUnit;
    _data['inventory_item_id'] = inventoryItemId;
    _data['inventory_quantity'] = inventoryQuantity;
    _data['old_inventory_quantity'] = oldInventoryQuantity;
    _data['requires_shipping'] = requiresShipping;
    _data['admin_graphql_api_id'] = adminGraphqlApiId;
    return _data;
  }
}

class Quantity {
  Quantity({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.sku,
  });
  late final int? id;
  late final int? productId;
  late final String? title;
  late final String? price;
  late final String? sku;

  Quantity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['title'] = title;
    _data['price'] = price;
    _data['sku'] = sku;

    return _data;
  }
}

class Options {
  Options({
    required this.id,
    required this.productId,
    required this.name,
    required this.position,
    required this.values,
  });
  late final int id;
  late final int productId;
  late final String name;
  late final int position;
  late final List<String> values;

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    position = json['position'];
    values = List.castFrom<dynamic, String>(json['values']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['name'] = name;
    _data['position'] = position;
    _data['values'] = values;
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
  late final List<dynamic> variantIds;
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
    variantIds = List.castFrom<dynamic, dynamic>(json['variant_ids']);
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
  late final List<dynamic> variantIds;
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
    variantIds = List.castFrom<dynamic, dynamic>(json['variant_ids']);
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
