class Category {
  final String? name;
  final String? imagePath;
  final List<Subcategories>? subcategories;

  Category({
    this.name,
    this.imagePath,
    this.subcategories,
  });

  Category.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        imagePath = json['imagePath'] as String?,
        subcategories = (json['subcategories'] as List?)
            ?.map((dynamic e) =>
                Subcategories.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'name': name,
        'imagePath': imagePath,
        'subcategories': subcategories?.map((e) => e.toJson()).toList()
      };
}

class Subcategories {
  final String? name;
  final String? imagePath;
  final List<dynamic>? subSubcategories;
  final bool? isExpanded;

  Subcategories({
    this.name,
    this.imagePath,
    this.subSubcategories,
    this.isExpanded,
  });

  Subcategories.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        imagePath = json['imagePath'] as String?,
        subSubcategories = json['subSubcategories'] as List?,
        isExpanded = json['isExpanded'] as bool?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'imagePath': imagePath,
        'subSubcategories': subSubcategories,
        'isExpanded': isExpanded
      };
}
