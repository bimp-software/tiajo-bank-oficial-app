class SchoolModel {
  final int id;
  final String name;
  final String slug;
  final String? logoUrl;

  SchoolModel({
    required this.id,
    required this.name,
    required this.slug,
    this.logoUrl,
  });
}