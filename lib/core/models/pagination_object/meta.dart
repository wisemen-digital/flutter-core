class Meta {
  int total;
  int pages;
  int page;

  Meta({
    this.total = 0,
    this.pages = 0,
    this.page = 0,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json['total'] as int? ?? 0,
        pages: json['pages'] as int? ?? 0,
        page: json['page'] as int? ?? 0,
      );
}
