class PaginatedResponse<T> {
  final List<T> items;
  final int total;
  final int limit;
  final int skip;

  PaginatedResponse({
    required this.items,
    required this.total,
    required this.limit,
    required this.skip,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic item) fromJsonT,
  ) {
    final list = (json["products"] as List<dynamic>? ?? [])
        .map(fromJsonT)
        .toList();

    return PaginatedResponse<T>(
      items: list,
      total: json["total"] ?? 0,
      limit: json["limit"] ?? 0,
      skip: json["skip"] ?? 0,
    );
  }
}