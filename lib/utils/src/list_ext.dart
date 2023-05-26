extension IterableExt on Iterable {
  List<T> compact<T>({bool growable = true}) {
    return List<T>.from(
      where((e) => e != null).toList(growable: growable),
    );
  }

  bool equals(List list) {
    if (length != list.length) return false;
    return every((e) => list.contains(e));
  }
}
