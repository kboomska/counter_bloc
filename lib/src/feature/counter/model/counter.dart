class Counter {
  Counter({
    required this.count,
  });

  final int count;

  Counter copyWith({int? count}) => Counter(
        count: count ?? this.count,
      );
}
