class Links {
  String? next;
  String? previous;

  Links({
    this.next,
    this.previous,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json['next'] as String?,
        previous: json['previous'] as String?,
      );
}
