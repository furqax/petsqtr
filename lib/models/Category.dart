class Category {
  final String name;
  final String imagePath;
  final List<Subcategory> subcategories;

  Category({
    required this.name,
    required this.imagePath,
    required this.subcategories,
  });
}

class Subcategory {
  final String name;
  final String imagePath;
  final List<SubSubcategory> subSubcategories;
  bool isExpanded;
  Subcategory({
    required this.name,
    required this.imagePath,
    required this.subSubcategories,
    required this.isExpanded,
  });
}

class SubSubcategory {
  final String name;
  final String imagePath;

  SubSubcategory({
    required this.name,
    required this.imagePath,
  });
}
