class Counter {
  const Counter({
    required this.count,
  });

  final int count;

  Counter copyWith({
    int? count,
  }) {
    return Counter(
      count: count ?? this.count,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Counter && other.count == count;
  }

  @override
  int get hashCode => count.hashCode;
}
